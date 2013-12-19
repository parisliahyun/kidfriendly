class ChangeColumnInterestsInUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
    t.remove :interests
  end
  end
end
