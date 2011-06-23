class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.references :appointment, :null => false
      t.integer :order, :null => false
      t.integer :pfile

      t.timestamps
    end
  end

  def self.down
    drop_table :series
  end
end
