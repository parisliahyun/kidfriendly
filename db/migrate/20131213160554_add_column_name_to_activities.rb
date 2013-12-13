class AddColumnNameToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.string :name
    end
  end
end
