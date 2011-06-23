class Appointment < ActiveRecord::Base
  belongs_to :visit
  belongs_to :researcher
  
  validates_presence_of :visit, :researcher, :appointment_date
  
  delegate :initials, :to => :researcher, :prefix => true
  delegate :visit_number, :to => :visit
  delegate :enumbers, :to => :visit
  delegate :study_rmr, :to => :mri_scan
  
  has_one :mri_scan
  has_many :series
  has_many :series_metainfos, :through => :series
  has_many :series_log_items, :through => :series

  has_many :scan_tasks, :through => :series
  has_many :pulse_sequences, :through => :series
    
  acts_as_reportable :except => [:created_at, :updated_at]
  
  def total_series_description_agreement
    matching_series = series.map(&:series_detail_agreement).reject(&:blank?)
    matching_series.sum / matching_series.length unless matching_series.sum == 0
  end
end
