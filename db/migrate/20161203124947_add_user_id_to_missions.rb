class AddUserIdToMissions < ActiveRecord::Migration[5.0]
  def change
    add_column :missions, :user_id, :integer
  end
end
