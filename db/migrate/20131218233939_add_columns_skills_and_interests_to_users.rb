class AddColumnsSkillsAndInterestsToUsers < ActiveRecord::Migration
  def change
      change_table :users do |t|
        t.text :interests 
        t.text :skills
    end
  end
end
