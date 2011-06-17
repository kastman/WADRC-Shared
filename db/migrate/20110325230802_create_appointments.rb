class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.references :visit,          :null => false
      t.date :appointment_date,     :null => false
      t.references :researcher
      t.text :appointment_comment

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
