class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|

      t.integer :user_id
      t.float :lat
      t.float :lng
      t.text :body
      t.string :shop_name
      t.string :cooking_genre
      t.string :peko
      
      t.timestamps
    end
  end
end
