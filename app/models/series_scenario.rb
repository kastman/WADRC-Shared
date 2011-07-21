class SeriesScenario < ActiveRecord::Base
  # Task or Pulse (Used for Task or Pulse witin-table polymorphic)
  belongs_to :series_scenario_category

  # Pfile, Sequence, Pre-task, Post-task (Used for Selecting)
  belongs_to :series_set_category
  
  validates_presence_of :series_set_category, :series_scenario_category
  
  has_many :series_log_items
  
  delegate :setname, :to => :series_set_category
  delegate :category_name, :to => :series_scenario_category
  
  validates :description,
    :uniqueness => { :scope => :series_set_category },
    :presence => true
  
end
