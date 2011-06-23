class Series < ActiveRecord::Base
  belongs_to :appointment
  
  validates_presence_of :appointment, :order
  validates :pfile, 
    :format => {:with => /\d{5}/, :allow_blank => :true}, 
    :uniqueness => {:scope => :appointment, :allow_nil => :true}
  
  has_one :series_log_item, :dependent => :destroy
  has_one :series_metainfo, :dependent => :destroy
  
  delegate :appointment_date, :to => :appointment
  delegate :description, :to => :series_log_item
  delegate :setname, :to => :series_log_item
  
  scope :pulse_series_by_log_items, joins(:series_log_item => :functional_scenario).where(:series_log_item => {:functional_scenario => {:functional_set_id => FunctionalSet.find_by_setname("Pulse Sequence")}})
  
  def formatted_pfile
    pfile && "P%05i.7" % pfile
  end
  
  def series_detail_agreement
    if series_metainfo.present? && series_log_item.present? && series_log_item.functional_scenario.present?
      Levenshtein.normalized_distance(series_metainfo.series_description.downcase,series_log_item.description.downcase)
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
  
end
