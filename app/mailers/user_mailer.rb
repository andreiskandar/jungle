class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email
    @user = User.find_by_email(session[:email])
    raise @user.inspect
    # mail(to: @user.email, subject: 'Order Receipt')
  end


end
