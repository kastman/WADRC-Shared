class ScanTask < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :functional_scenario
  belongs_to :scan_series
  
  validates_format_of :pfile, :with => /\d{5}/
  validates_presence_of :appointment, :functional_scenario
  
  delegate :appointment_date, :to => :appointment
  delegate :description, :to => :functional_scenario, :prefix => true
end
