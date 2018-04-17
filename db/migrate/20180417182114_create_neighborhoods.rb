class CreateNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.text :description
      t.string :image_link

      t.timestamps
    end
  end
end
