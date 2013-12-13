class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer "vendor_id"
      t.integer "client_id"
      t.integer "activity_id"
      t.datetime "date"
      t.time "start"
      t.time "finish" 
      t.decimal "price"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end