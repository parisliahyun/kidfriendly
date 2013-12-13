class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string   "name"
      t.text     "description"
      t.string   "color"
      t.datetime "created_at",  :null => false
      t.datetime "updated_at",  :null => false
    end
  end
end
