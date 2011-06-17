class CreateDiagnosisMethods < ActiveRecord::Migration
  def self.up
    create_table :diagnosis_methods do |t|
      t.string :consensus_method

      t.timestamps
    end
  end

  def self.down
    drop_table :diagnosis_methods
  end
end
