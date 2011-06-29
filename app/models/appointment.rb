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
  
  # Take each functional task and set its series to the correct pulse sequence.
  def align_tasks
    pp task_log_items = scan_tasks
    pp series_with_metainfos = series.with_functional_metainfo.with_sequence_set
    # task_metainfos = series_metainfos.select {|m| m.series_description =~ /Task|fMRI/i}
    
    pp task_log_items.size
    pp series_with_metainfos.size

    task_log_items.zip(series_with_metainfos).each do |item, series|
      pp "Item: ", item
      pp "Series: ", series
      item.series = series
      item.save! if item.changed?
    end
  end
end
