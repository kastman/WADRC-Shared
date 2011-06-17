class CreateEnrollmentVisitMemberships < ActiveRecord::Migration
  def self.up
    create_table :enrollment_visit_memberships do |t|
      t.references :enrollment, :null => false
      t.references :visit,      :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :enrollment_visit_memberships
  end
end
