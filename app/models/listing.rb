class Listing < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :listings
end
