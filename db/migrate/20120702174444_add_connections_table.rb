class AddConnectionsTable < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :contact1_id, :null => false
      t.integer :contact2_id, :null => false
      t.timestamps
    end
  end
end
