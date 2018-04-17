class AddAddressToLandmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :landmarks, :address, :string
  end
end
