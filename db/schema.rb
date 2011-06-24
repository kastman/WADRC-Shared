# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110620174124) do

  create_table "appointments", :force => true do |t|
    t.integer  "visit_id",            :null => false
    t.date     "appointment_date",    :null => false
    t.integer  "researcher_id"
    t.text     "appointment_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["visit_id"], :name => "visit_id"
  add_index "appointments", ["researcher_id"], :name => "researcher_id"

  create_table "demographics", :force => true do |t|
    t.integer  "participant_id", :null => false
    t.string   "sex",            :null => false
    t.integer  "race_id",        :null => false
    t.date     "dob"
    t.integer  "education"
    t.integer  "handedness"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "demographics", ["participant_id"], :name => "participant_id"
  add_index "demographics", ["race_id"], :name => "race_id"

  create_table "diagnoses", :force => true do |t|
    t.string   "characterization"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diagnosis_methods", :force => true do |t|
    t.string   "consensus_method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollment_visit_memberships", :force => true do |t|
    t.integer  "enrollment_id", :null => false
    t.integer  "visit_id",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollment_visit_memberships", ["enrollment_id"], :name => "enrollment_id"
  add_index "enrollment_visit_memberships", ["visit_id"], :name => "visit_id"

  create_table "enrollments", :force => true do |t|
    t.integer  "participant_id",     :null => false
    t.string   "enumber",            :null => false
    t.date     "enroll_date"
    t.string   "recruitment_source"
    t.text     "withdrawl_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollments", ["participant_id"], :name => "participant_id"

  create_table "functional_scenarios", :force => true do |t|
    t.string   "description",       :null => false
    t.integer  "functional_set_id", :null => false
    t.integer  "intended_reps"
    t.string   "scenario_file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "functional_scenarios", ["functional_set_id"], :name => "functional_set_id"

  create_table "functional_sets", :force => true do |t|
    t.string   "setname",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mri_scans", :force => true do |t|
    t.integer  "appointment_id",                :null => false
    t.string   "study_rmr",                     :null => false
    t.integer  "exam_number"
    t.string   "study_initials"
    t.string   "radiology_outcome"
    t.text     "notes"
    t.string   "dicom_dvd"
    t.string   "study_path"
    t.integer  "created_by_id"
    t.string   "dicom_study_uid"
    t.integer  "study_scan_tech_id"
    t.datetime "study_start_time"
    t.datetime "study_end_time"
    t.integer  "scanner_hardware_goggles_id"
    t.integer  "scanner_hardware_buttonbox_id"
    t.boolean  "completed_fast"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mri_scans", ["appointment_id"], :name => "appointment_id"
  add_index "mri_scans", ["created_by_id"], :name => "created_by_id"
  add_index "mri_scans", ["study_scan_tech_id"], :name => "study_scan_tech_id"
  add_index "mri_scans", ["scanner_hardware_goggles_id"], :name => "scanner_hardware_goggles_id"
  add_index "mri_scans", ["scanner_hardware_buttonbox_id"], :name => "scanner_hardware_buttonbox_id"

  create_table "participants", :force => true do |t|
    t.string   "initials",        :null => false
    t.string   "wrapnum"
    t.integer  "reggieid",        :null => false
    t.text     "notes"
    t.boolean  "quality_redflag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "researchers", :force => true do |t|
    t.string   "initials",   :null => false
    t.string   "first",      :null => false
    t.string   "last",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scanner_hardwares", :force => true do |t|
    t.string   "name"
    t.string   "hardware_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", :force => true do |t|
    t.integer  "appointment_id", :null => false
    t.integer  "series_set_id",  :null => false
    t.integer  "order",          :null => false
    t.integer  "pfile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "series", ["appointment_id"], :name => "appointment_id"
  add_index "series", ["series_set_id"], :name => "series_set_id"

  create_table "series_log_items", :force => true do |t|
    t.integer  "series_id",              :null => false
    t.integer  "functional_scenario_id"
    t.string   "logfile"
    t.boolean  "has_concerns"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "series_log_items", ["series_id"], :name => "series_id"
  add_index "series_log_items", ["functional_scenario_id"], :name => "functional_scenario_id"

  create_table "series_metainfos", :force => true do |t|
    t.integer  "series_id",                                             :null => false
    t.string   "rmr",                                                   :null => false
    t.string   "series_description",                                    :null => false
    t.string   "path",                                                  :null => false
    t.datetime "timestamp",                                             :null => false
    t.string   "scanned_file",                                          :null => false
    t.string   "glob"
    t.decimal  "rep_time",               :precision => 10, :scale => 0
    t.integer  "bold_reps"
    t.integer  "slices_per_volume"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.string   "dicom_series_uid"
    t.text     "dicom_taghash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "series_metainfos", ["series_id"], :name => "series_id"

  create_table "series_sets", :force => true do |t|
    t.string   "setname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visit_diagnoses", :force => true do |t|
    t.integer  "diagnosis_id",        :null => false
    t.integer  "visit_id",            :null => false
    t.integer  "diagnosis_method_id", :null => false
    t.integer  "diagnoser_id",        :null => false
    t.datetime "diagnosis_date",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visit_diagnoses", ["diagnosis_id"], :name => "diagnosis_id"
  add_index "visit_diagnoses", ["visit_id"], :name => "visit_id"
  add_index "visit_diagnoses", ["diagnosis_method_id"], :name => "diagnosis_method_id"
  add_index "visit_diagnoses", ["diagnoser_id"], :name => "diagnoser_id"

  create_table "visits", :force => true do |t|
    t.integer  "visit_number", :default => 1, :null => false
    t.text     "scan_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
