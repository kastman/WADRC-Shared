class ScannerHardware < ActiveRecord::Base
  validates_presence_of :name, :hardware_group
end
