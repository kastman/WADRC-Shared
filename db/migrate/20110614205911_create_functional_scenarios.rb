class CreateFunctionalScenarios < ActiveRecord::Migration
  def self.up
    create_table :functional_scenarios do |t|
      t.string :description, :null => false
      t.references :functional_set, :null => false
      t.integer :intended_reps
      t.string :scenario_file

      t.timestamps
    end
  end

  def self.down
    drop_table :functional_scenarios
  end
end
