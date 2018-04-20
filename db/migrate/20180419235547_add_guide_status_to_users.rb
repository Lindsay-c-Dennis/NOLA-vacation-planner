class AddGuideStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :guide_status, :boolean, null: false, default: false
  end
end
