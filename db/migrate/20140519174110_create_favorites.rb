class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :listing_id
      t.integer :user_id
      t.datetime :favorited_date
      t.timestamps
    end
  end
end
