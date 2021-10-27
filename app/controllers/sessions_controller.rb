class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    username = params[:username]
    password = params[:password_digest]

    user = User.find_by(username: username)
    if user
      if user.authenticate(password)
        session[:user_id] = user.id
        redirect_to '/welcome', notice: "Logged in!"
      else
        redirect_to '/login', notice: 'Username atau password salah'
      end
    else
      redirect_to '/login', notice: 'Username atau password salah'
    end
  end

  def login
  end

  def welcome
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/welcome', notice: "Logged out!"
  end

  def page_requires_login

  end
end
