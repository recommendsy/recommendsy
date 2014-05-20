class AddListingUrlToListings < ActiveRecord::Migration
  def change
    add_column :listings, :listing_url, :string
  end
end
