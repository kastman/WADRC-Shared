class CreateSeriesMetainfos < ActiveRecord::Migration
  def self.up
    create_table :series_metainfos do |t|
      t.references :series, :null => false
      t.string :rmr, :null => false
      t.string :series_description, :null => false
      t.string :path, :null => false
      t.datetime :timestamp, :null => false
      t.string :scanned_file, :null => false
      t.string :glob
      t.decimal :rep_time
      t.integer :bold_reps
      t.integer :slices_per_volume
      t.string :thumbnail_file_name
      t.string :thumbnail_content_type
      t.integer :thumbnail_file_size
      t.datetime :thumbnail_updated_at
      t.string :dicom_series_uid
      t.text :dicom_taghash

      t.timestamps
    end
  end

  def self.down
    drop_table :series_metainfos
  end
end
