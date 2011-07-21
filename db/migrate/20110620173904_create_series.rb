class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.references :series_set, :null => false
      t.integer :position, :null => false
      t.integer :pfile

      t.timestamps
    end
  end

  def self.down
    drop_table :series
  end
end
