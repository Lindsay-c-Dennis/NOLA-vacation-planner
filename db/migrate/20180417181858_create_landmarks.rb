class CreateLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.text :description
      t.string :neighborhood
      t.string :category
      t.string :image_link
      t.string :more_info_link

      t.timestamps
    end
  end
end
