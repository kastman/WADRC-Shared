class CreateSeriesLogItems < ActiveRecord::Migration
  def self.up
    create_table :series_log_items do |t|
      t.references :series, :null => false
      t.references :series_scenario
      t.string :logfile
      t.boolean :has_concerns
      t.boolean :functional
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :series_log_items
  end
end
