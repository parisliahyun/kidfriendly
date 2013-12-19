class RemoveColumnSkillsFromUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.remove :skills
    end
  end
end
