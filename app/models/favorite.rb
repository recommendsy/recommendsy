class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validates :user, uniqueness: { scope: :listing }
end
