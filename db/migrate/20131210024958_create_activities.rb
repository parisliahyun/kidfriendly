class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :image_url
      t.text :description
      t.text :tags, array: true
      t.date     "date"
      t.time     "time"
      t.decimal  "price"
      t.integer  "requester_id"
      t.integer  "vendor_id"
    end
  end
end
