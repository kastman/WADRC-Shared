class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
      t.integer :visit_number,      :null => false, :default => 1
      t.text :scan_note

      t.timestamps
    end
  end

  def self.down
    drop_table :visits
  end
end
