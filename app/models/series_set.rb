class SeriesSet < ActiveRecord::Base
  PFILE_SERIES_SET = SeriesSet.find_or_create_by_setname('pfile')
  SEQUENCE_SET = SeriesSet.find_or_create_by_setname('sequence')
  OUT_OF_SCANNER_SET = SeriesSet.find_or_create_by_setname('computer-task')
  # TASKONLY_PRE_SET = SeriesSet.find_or_create_by_setname('pre')
  # TASKONLY_POST_SET = SeriesSet.find_or_create_by_setname('post')
  
  
  validates_uniqueness_of :setname
  
  has_many :series
end
