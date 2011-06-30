class SeriesSet < ActiveRecord::Base
  PFILE_SERIES_SET = SeriesSet.find_or_create_by_setname('pfile')
  OUT_OF_SCANNER_SET = SeriesSet.find_or_create_by_setname('computer-task')
  SEQUENCE_SET = SeriesSet.find_or_create_by_setname('sequence')
  
  has_many :series
end
