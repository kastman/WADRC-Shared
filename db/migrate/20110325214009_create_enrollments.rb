# require 'migration_helpers'
class CreateEnrollments < ActiveRecord::Migration
  # extend MigrationHelpers
  def self.up
    create_table :enrollments do |t|
      t.references :participant,      :null => false
      t.string :enumber,              :null => false
      t.date :enroll_date
      t.string :recruitment_source
      t.text :withdrawl_reason

      t.timestamps
    end
    
    # add_foreign_key(:enrollments, :participant_id, :participants)
  end

  def self.down
    drop_table :enrollments
  end
end
