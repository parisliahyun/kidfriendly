class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.text :connections, array: true
      t.timestamps
    end
  end
end
