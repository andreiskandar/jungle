class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    raise  @user.email
    if @user.save
      session[:user_email] = @user.email
      redirect_to :root, notice: 'New User Created'
    else
      render :new
    end

  end

  private
    def user_params 
      params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
      )
    end
end
