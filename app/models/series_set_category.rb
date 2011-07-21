class SeriesSetCategory < ActiveRecord::Base
  PFILE     = find_by_setname('pfile')
  SEQUENCE  = find_by_setname('sequence')
  PRE       = find_by_setname('pre-task')
  POST      = find_by_setname('post-task')

  validates :setname, :uniqueness => true, :presence => true

  has_many :series_scenarios
  has_many :series_sets
  has_many :series, :through => :series_sets
  
end
