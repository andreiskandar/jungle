class SessionsController < ApplicationController
  # before_filter authorize
  # raise authorize.inspect
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(session_params[:email])
    if @user && @user.authenticate(session_params[:password])
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

  private
  def session_params 
    params.require(:sessions).permit(
    :email,
    :password,
    )
  end

  
end
