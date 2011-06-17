class CreateResearchers < ActiveRecord::Migration
  def self.up
    create_table :researchers do |t|
      t.string :initials, :null => false
      t.string :first,    :null => false
      t.string :last,     :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :researchers
  end
end
