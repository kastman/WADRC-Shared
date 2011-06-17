class CreateScanTasks < ActiveRecord::Migration
  def self.up
    create_table :scan_tasks do |t|
      t.references :appointment, :null => false
      t.references :functional_scenario, :null => false
      t.references :scan_series, :references => nil
      t.integer :series_order
      t.integer :preday_order
      t.string :pfile
      t.boolean :has_concerns
      t.string :concerns
      t.string :functional_note

      t.timestamps
    end
  end

  def self.down
    drop_table :scan_tasks
  end
end
