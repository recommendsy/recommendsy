class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def etsy
    request_env = request.env['omniauth.auth']
    @user = User.find_for_etsy_oauth(request_env)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => 'Etsy') if is_navigational_format?
    else
      session['devise.etsy_data'] = request_env
      redirect_to new_user_registration_url
    end
  end
end
