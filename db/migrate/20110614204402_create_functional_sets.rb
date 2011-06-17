class CreateFunctionalSets < ActiveRecord::Migration
  def self.up
    create_table :functional_sets do |t|
      t.string :setname, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :functional_sets
  end
end
