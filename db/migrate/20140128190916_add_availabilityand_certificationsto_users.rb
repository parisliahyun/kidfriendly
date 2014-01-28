class AddAvailabilityandCertificationstoUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.text :certifications 
    end
  end
end
