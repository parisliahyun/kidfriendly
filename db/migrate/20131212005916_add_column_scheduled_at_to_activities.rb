class AddColumnScheduledAtToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.datetime :scheduled_at
    end
  end
end
