class CreateSeriesSetCategories < ActiveRecord::Migration
  def self.up
    create_table :series_set_categories do |t|
      t.string :setname

      t.timestamps
    end
  end

  def self.down
    drop_table :series_set_categories
  end
end
