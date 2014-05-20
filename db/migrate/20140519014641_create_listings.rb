class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :image_url
      t.text :description
      t.string :listing_id
      t.string :price
      t.timestamps
    end
  end
end
