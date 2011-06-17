class Race < ActiveRecord::Base
  has_many :demographics
  validates_presence_of :name
end
