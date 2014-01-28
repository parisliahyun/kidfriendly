class AddVenueAgerangeandHeadlinetoActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.text :venue  
      t.text :age_range 
      t.text :headline
    end
  end
end
