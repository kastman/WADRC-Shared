class Series < ActiveRecord::Base
  # SeriesSet Constants are defined in SeriesSet.rb
  # FunctionalSet Constants are defined in FunctionalSet.rb

  belongs_to :appointment
  belongs_to :series_set
  
  validates :appointment,
    :presence => true
    
  validates :order, :uniqueness => {:scope => [:series_set, :appointment]}
    
  validates :series_set,
    :presence => true
    
  validates :pfile, 
    :numericality => true, :allow_nil => true,
    :uniqueness => {:scope => :appointment, :allow_nil => :true}
  
  has_one :series_metainfo, :dependent => :destroy
  has_many :series_log_items, :dependent => :destroy

  has_one :pulse_sequence, :class_name => "SeriesLogItem", :include => :functional_scenario, :conditions => "`functional_scenarios`.`functional_set_id` = 8", :dependent => :destroy
  has_one :scan_task, :class_name => "SeriesLogItem", :include => :functional_scenario, :conditions => "`functional_scenarios`.`functional_set_id` = 3", :dependent => :destroy
  
  delegate :appointment_date, :to => :appointment
  delegate :description, :to => :series_log_item
  delegate :setname, :to => :series_set
  
  # scope :with_pulse_sequences, joins(:series_log_items => :functional_scenario).where(:series_log_items => {:functional_scenario => {:functional_set_id => FunctionalSet.find_by_setname("Pulse Sequence")}})
  scope :with_pulse_sequences, includes(:series_log_items => :functional_scenario).where(
    {:series_log_items => { :id => nil}} | 
    {:series_log_items => { :functional_scenarios => { :functional_set_id.not_in => FunctionalSet::TASK_FUNCTIONAL_SET_IDS}}}
  )
  scope :with_scan_tasks, joins(:series_log_items => :functional_scenario).where(:series_log_items => {:functional_scenario => {:functional_set_id => FunctionalSet.find_by_setname("In-Scan Task")}})
  scope :with_pulses_or_tasks, includes(:series_log_items => :functional_scenario).where(
    {:series_log_items => {:functional_scenarios => {:functional_set_id => [3,8] }}} |
    {:series_log_items => { :id => nil}}    
  )
  scope :with_functional_metainfo, joins(:series_metainfo).where(:series_metainfo => {:series_description => /Task|Rest|Run/i})
  
  scope :without_related_info, where("(`id` NOT IN (SELECT `series_id` FROM `series_log_items`)) AND (`id` NOT IN (SELECT `series_id` FROM `series_metainfos`))")
  scope :with_sequence_set, where(:series_set => SeriesSet::SEQUENCE_SET)
  
  def formatted_pfile
    pfile && "P%05i.7" % pfile
  end
  
  def series_detail_agreement
    if series_metainfo.present? && pulse_sequence.present? && pulse_sequence.functional_scenario.present?
      Levenshtein.normalized_distance(series_metainfo.series_description.downcase, pulse_sequence.description.downcase)
    end
  end
  
  def self.merge(preferred, duplicate)
    self.transaction do
      # pp "preferred :", preferred
      # pp "duplicate:", duplicate
          
      next if duplicate.pfile.present?
    
      if duplicate.series_log_item.present?
        pp attrs = duplicate.series_log_item.attributes
        attrs.delete("series_id")
        preferred.series_log_item.update_attributes!(attrs)
        # duplicate.series_log_item.destroy
      end
    
      # In this case, just go on the assumption that if metainfo is present it's wrong. Maybe I should add has_many series_metainfos? That might solve some things.
      # if duplicate.series_metainfo.present?
        # attrs = duplicate.series_metainfo.attributes
        # attrs.delete("series_id")
        # preferred.series_metainfo.update_attributes!(attrs)
        # duplicate.series_metainfo.destroy
      # end
      # duplicate.destroy
      return true
    end
  end
  
  # First check presence of Pfile (except VIPR PFiles)
  # Then, if log items are present, check if the set is Pre or Post and assign those computer tasks.
  # If no log items are present or there are none in the pre or post sets, then assign a sequence.
  def associate_with_series_set
    
    if pfile.present?
      unless series_metainfo.present? && series_metainfo.series_description =~ /VIPR/i
        self.series_set = PFILE_SERIES_SET
      end
    elsif series_log_items.present? 
      unless series_log_items.select{ |li| li.functional_scenario.present? && li.setname =~ /Pre|Post/i }.blank?
        self.series_set = OUT_OF_SCANNER_SET
      else
        self.series_set = SEQUENCE_SET
      end
    else
      self.series_set = SEQUENCE_SET
    end
    
    if self.changed?
      unless save
        return [self, self.errors]
      end
    end
    
    return true
  end
  
  
end
