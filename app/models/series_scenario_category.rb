class SeriesScenarioCategory < ActiveRecord::Base
  TASK  = find_by_category_name('task')
  PULSE = find_by_category_name('pulse')
  
  validates :category_name, :presence => true
  
  has_many :series_scenarios
end
