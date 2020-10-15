class SessionsController < ApplicationController
  # before_filter :authorize
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    raise @user.inspect
    if @user && @user.authenticate(params[:password])
      session[:user_email] = @user.email
      redirect_to :root
    else
      flash[:error] = 'An error occured!'
      redirect_to login_users_path
    end
  end

  def destroy 
    session[:user_email] = nil
    redirect_to :root
  end

  
end
