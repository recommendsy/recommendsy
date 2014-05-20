class ChangeArrayInListingsToUseString < ActiveRecord::Migration
  def change
    remove_column :listings, :images
  end
end
