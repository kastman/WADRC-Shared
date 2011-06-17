class Demographic < ActiveRecord::Base
  belongs_to :participant
  belongs_to :race
  
  validates_presence_of :race, :sex, :participant
  delegate :name, :to => :race, :prefix => true
  
  acts_as_reportable :except => ['created_at', 'updated_at']
end
