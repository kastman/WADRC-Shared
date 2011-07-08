class CreateMriScans < ActiveRecord::Migration
  def self.up
    create_table :mri_scans do |t|
      t.references :appointment, :null => false
      t.string :study_rmr, :null => false
      t.string :scanner_source
      t.integer :exam_number
      t.string :study_initials
      t.string :radiology_outcome
      t.text :notes
      t.string :dicom_dvd
      t.string :study_path
      t.references :created_by, :references => :researchers
      t.string :dicom_study_uid
      t.references :study_scan_tech, :references => :researchers
      t.datetime :study_start_time
      t.datetime :study_end_time
      t.references :scanner_hardware_goggles, :references => :scanner_hardwares
      t.references :scanner_hardware_buttonbox, :references => :scanner_hardwares
      t.boolean :completed_fast

      t.timestamps
    end
  end

  def self.down
    drop_table :mri_scans
  end
end
