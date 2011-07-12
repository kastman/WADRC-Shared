class EnrollmentVisitMembershipQinling < ActiveRecord::Base
  establish_connection :panda_production
  set_table_name "enrollment_visit_memberships"
  set_primary_key "id"

  belongs_to :enrollment_qinling, :foreign_key => :enrollment_id
  belongs_to :visit_qinling, :foreign_key => :visit_id
  
  validates_uniqueness_of :enrollment_id, :scope => :visit_id, :message => "You're trying to duplicate a many-to-many relationship."
  validates_presence_of :enrollment_id, :visit_id
end
