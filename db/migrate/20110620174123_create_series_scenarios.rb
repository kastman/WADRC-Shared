class CreateSeriesScenarios < ActiveRecord::Migration
  def self.up
    create_table :series_scenarios do |t|
      t.string :description, :null => false
      t.references :series_scenario_category, :null => false
      t.references :series_set_category, :null => false
      t.integer :intended_reps
      t.string :scenario_file

      t.timestamps
    end
  end

  def self.down
    drop_table :series_scenarios
  end
end
