class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.string :initials, :null => false
      t.string :wrapnum
      t.integer :reggieid, :null => false
      t.text :notes
      t.boolean :quality_redflag

      t.timestamps
    end
  end

  def self.down
    drop_table :participants
  end
end
