class AddMissionIdToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :mission_id, :integer
  end
end
