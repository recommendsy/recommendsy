class UsersController < ApplicationController
  before_action :authenticate_admin, :only => [:show]

  def show
    @user = User.find(params[:id])
    etsy_user = Etsy.user(@user.nickname)
    @user_favorites = etsy_user.favorites
  end

  def authenticate_admin
    Etsy.api_key = ENV['ETSY_TOKEN']
  end
end