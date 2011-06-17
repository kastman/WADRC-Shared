class Enrollment < ActiveRecord::Base
  belongs_to :participant
  has_many :enrollment_visit_memberships
  has_many :visits, :through => :enrollment_visit_memberships
  delegate :reggieid, :initials, :to => :participant, :prefix => true
  
  default_scope order :enumber
  
  acts_as_reportable :except => ['created_at', 'updated_at']
end
