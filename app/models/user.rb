class User < ActiveRecord::Base
  has_many :favorites
  has_many :listings, through: :favorites
  has_many :reminders
  has_many :recipients, through: :reminders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:etsy]

  def self.find_for_etsy_oauth(auth)
    where(:email => auth["info"]["email"]).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.user_id = auth.info.user_id
      user.image = auth.info.image
      user.bio = auth.info.profile.bio
      user.birth_month = auth.info.profile.birth_month
      user.birth_day = auth.info.profile.birth_day
      user.birth_year = auth.info.profile.birth_year
      user.transaction_buy_count = auth.info.profile.transaction_buy_count
      user.transaction_sold_count = auth.info.profile.transaction_sold_count
    end
  end

  def grab_favorites
    Etsy.api_key = ENV['ETSY_TOKEN']
    user = Etsy.user(self.nickname)
    user.favorites.each do |favorite|
      new_listing = Listing.find_or_create_by(
        title: favorite.title,
        listing_url: favorite.url,
        description: favorite.description,
        listing_id: favorite.id.to_s,
        price: favorite.price
      )

      favorite_images = favorite.images.map do |image|
        image.full
      end

      new_listing.update(images: favorite_images)

      if !self.listings.include? new_listing
        self.listings << new_listing
        new_listing.save
      end

      sleep(0.1)
    end
    self.favorites
  end

  private
    
end
