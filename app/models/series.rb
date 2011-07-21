class Series < ActiveRecord::Base
  # SeriesSetCategory Constants are defined in SeriesSet.rb
      
  validates_uniqueness_of :position, :scope => :series_set
    
  validates :series_set,
    :presence => true
    
  validates :pfile, 
    :numericality => true, :allow_nil => true,
    :uniqueness => {:scope => :series_set, :allow_nil => :true}

  belongs_to :series_set
  
  has_one :series_metainfo, :dependent => :destroy
  has_many :series_log_items, :dependent => :destroy

  has_one :pulse_sequence, :class_name => "SeriesLogItem", :include => :series_scenario, :conditions => {:series_scenarios => {:series_scenario_category_id => SeriesScenarioCategory::PULSE} }, :dependent => :destroy
  has_one :scan_task, :class_name => "SeriesLogItem", :include => :series_scenario, :conditions => {:series_scenarios => {:series_scenario_category_id => SeriesScenarioCategory::TASK} } , :dependent => :destroy
  
  delegate :description, :to => :series_log_item
  delegate :setname, :appointment, :to => :series_set
  delegate :appointment_date, :to => :appointment
    
  scope :with_functional_metainfo, joins(:series_metainfo).where(:series_metainfo => {:series_description => /Task|Rest|Run/i})
  
  # Slight Improvement to selecting without related info using joins instead of subqueries - a little bit faster.
  # scope :without_related_info, where("(`id` NOT IN (SELECT `series_id` FROM `series_log_items`)) AND (`id` NOT IN (SELECT `series_id` FROM `series_metainfos`))")
  scope :without_related_info, includes(:series_metainfo, :series_log_items).where(:series_log_items => {:id => nil}, :series_metainfos => {:id => nil}).select("id")
  scope :with_sequence_set, joins(:series_set).where(:series_set => {:series_set_category => SeriesSetCategory::SEQUENCE})

  
  def formatted_pfile
    pfile && "P%05i.7" % pfile
  end
  
  def series_detail_agreement
    if series_metainfo.present? && pulse_sequence.present? && pulse_sequence.series_scenario.present?
      Levenshtein.normalized_distance(series_metainfo.series_description.downcase, pulse_sequence.description.downcase)
    end
  end  
  
end
