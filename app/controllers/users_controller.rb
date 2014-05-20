class UsersController < ApplicationController
  before_action :authenticate_admin, :only => [:show]

  def show
    @user = User.find(params[:id])
    @user_favorites = @user.grab_favorites
  end

  def etsy_poke_email
    @user = User.find(params[:id])
    EtsyMailer.etsy_poke(@user).deliver
    respond_to do |format|
      format.json {
        render json: 'success'
      }
    end
  end

  def authenticate_admin
    Etsy.api_key = ENV['ETSY_TOKEN']
  end
end