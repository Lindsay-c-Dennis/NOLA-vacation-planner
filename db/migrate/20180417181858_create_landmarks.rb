class CreateLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.text :description
      t.string :image_link
      t.string :more_info_link
      t.integer :neighborhood_id
      t.integer :category_id

      t.timestamps
    end
  end
end
