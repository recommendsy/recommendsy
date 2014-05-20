class EtsyMailer < ActionMailer::Base
  default from: "yangsunwoo@gmail.com"

  def etsy_poke(user)
    @user = user
    mail(to: @user.email, subject: 'Someone wants to buy you something from Etsy')
  end
end
