class SessionsController < ApplicationController
  before_filter :authorize
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_email] = @user.email
      redirect_to :root
    else
      redirect_to '/login'
    end
  end

  def destroy 
    session[:user_email] = nil
    redirect_to :root
  end

  
end
