class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :bio))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

end
