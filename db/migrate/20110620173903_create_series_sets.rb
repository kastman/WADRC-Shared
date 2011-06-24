class CreateSeriesSets < ActiveRecord::Migration
  def self.up
    create_table :series_sets do |t|
      t.string :setname

      t.timestamps
    end
  end

  def self.down
    drop_table :series_sets
  end
end
