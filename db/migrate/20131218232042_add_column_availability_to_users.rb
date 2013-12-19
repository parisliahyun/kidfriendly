class AddColumnAvailabilityToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.text :availability 
    end
  end
end

