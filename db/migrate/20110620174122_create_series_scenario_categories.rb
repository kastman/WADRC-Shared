class CreateSeriesScenarioCategories < ActiveRecord::Migration
  def self.up
    create_table :series_scenario_categories do |t|
      t.string :category_name, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :series_scenario_categories
  end
end
