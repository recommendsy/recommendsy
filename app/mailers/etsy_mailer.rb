class EtsyMailer < ActionMailer::Base
  default from: "yangsunwoo@gmail.com"

  def etsy_poke(user, current_user, current_url)
    @user = user
    @current_user = current_user
    @current_url = current_url
    mail(to: @user.email, subject: 'Someone wants to buy you something from Etsy')
  end
end
