class AddColumnUserIdToSchedules < ActiveRecord::Migration
  def change
    change_table :schedules do |t|
      t.integer :user_id
    end
  end
end
