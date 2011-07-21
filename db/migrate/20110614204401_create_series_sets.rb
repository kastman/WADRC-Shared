class CreateSeriesSets < ActiveRecord::Migration
  def self.up
    create_table :series_sets do |t|
      t.references :appointment
      t.references :series_set_category
      t.integer :position_in_category, :default => 1, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :series_sets
  end
end
