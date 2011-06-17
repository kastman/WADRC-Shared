class EnrollmentVisitMembership < ActiveRecord::Base
  belongs_to :enrollment
  belongs_to :visit
  
  validates_presence_of :enrollment, :visit
  
  acts_as_reportable :except => [:created_at, :updated_at]
end
