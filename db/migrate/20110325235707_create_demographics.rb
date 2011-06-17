class CreateDemographics < ActiveRecord::Migration
  def self.up
    create_table :demographics do |t|
      t.references :participant,  :null => false
      t.string :sex,              :null => false, :length => 1
      t.references :race,         :null => false
      t.date :dob
      t.integer :education
      t.integer :handedness

      t.timestamps
    end
  end

  def self.down
    drop_table :demographics
  end
end
