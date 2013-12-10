class AddProfiletoUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string
    add_column :users, :image_url, :string 
    add_column :users, :about, :text  
    add_column :users, :interests, :text, array: true
    add_column :users, :skills, :text, array: true
  end
end
