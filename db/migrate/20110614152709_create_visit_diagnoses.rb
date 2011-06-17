class CreateVisitDiagnoses < ActiveRecord::Migration
  def self.up
    create_table :visit_diagnoses do |t|
      t.references :diagnosis, :null => false
      t.references :visit, :null => false
      t.references :diagnosis_method, :null => false
      t.references :diagnoser, :null => false, :references => :researchers
      t.datetime :diagnosis_date, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :visit_diagnoses
  end
end
