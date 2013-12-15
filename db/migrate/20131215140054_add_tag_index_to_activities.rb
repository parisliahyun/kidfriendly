class AddTagIndexToActivities < ActiveRecord::Migration
  def change
    add_index  :activities, :tags, using: 'gin'
  end
end
