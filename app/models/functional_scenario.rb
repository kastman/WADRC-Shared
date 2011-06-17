class FunctionalScenario < ActiveRecord::Base
  belongs_to :functional_set
  has_many :scan_tasks
  
  validates_presence_of :functional_set
  delegate :setname, :to => :functional_set
end
