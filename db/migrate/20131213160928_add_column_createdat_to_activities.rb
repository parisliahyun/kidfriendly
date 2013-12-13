class AddColumnCreatedatToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
  end
end
