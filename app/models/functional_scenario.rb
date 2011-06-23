class FunctionalScenario < ActiveRecord::Base
  belongs_to :functional_set
  has_many :series_log_items
  
  validates_presence_of :functional_set
  delegate :setname, :to => :functional_set
end
