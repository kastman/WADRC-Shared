class CreateScannerHardwares < ActiveRecord::Migration
  def self.up
    create_table :scanner_hardwares do |t|
      t.string :name
      t.string :hardware_group

      t.timestamps
    end
  end

  def self.down
    drop_table :scanner_hardwares
  end
end
