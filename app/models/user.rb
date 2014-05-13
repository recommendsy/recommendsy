class User < ActiveRecord::Base
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
end
