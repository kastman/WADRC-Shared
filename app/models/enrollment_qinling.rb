class EnrollmentQinling < ActiveRecord::Base
  establish_connection :panda_production
  set_table_name "enrollments"
  set_primary_key "id"
  
  has_many :enrollment_visit_membership_qinlings
  has_many :visit_qinlings, :through => :enrollment_visit_membership_qinlings, :uniq => true
  
  belongs_to :recruitment_group
  belongs_to :participant
  
  validates_uniqueness_of :enumber, :allow_nil => true
  validates_format_of :enumber, :with => /.*\d{3,}\Z/, :message => "must end with at least 3 digits to be valid."
  
  acts_as_reportable
  
  
  def withdrawn?
    not withdrawl_reason.blank?
  end
end
