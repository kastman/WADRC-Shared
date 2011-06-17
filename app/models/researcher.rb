class Researcher < ActiveRecord::Base
  validates_presence_of :initials, :first, :last
  
  has_many :appointments
end
