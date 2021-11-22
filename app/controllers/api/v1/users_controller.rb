class Api::V1::UsersController < ApiController
  skip_before_action :authentication_access_token, only: :create

  def index
    # Index User
    users = UserService::IndexUserService.new.call
    render json: { users: users.as_json(only: [:username, :name, :email]) }
  rescue StandardError => e
    render json: { error: e }
  end

  

  def create
    # Create User >> Registration endpoint
    user = UserService::CreateUserService.new(params[:username], params[:name], params[:email], params[:password], params[:password_confirmation], params[:bio], params[:account_ids]).call
    render json: { user: user }
  rescue StandardError => e
    render json: { error: e }, status: 400
  end

  def show
    #Show User
    user = UserService::ShowUserService.new(params[:id]).call
    render json: {user: user}
  rescue StandardError => e
    render json: { error: e }
  end

  # def edit 
  #   #Edit User
  #   user = UserService::ShowUserService.new(params[:id]).call
  #   render json: {user: user}
  # rescue StandardError => e
  #   render json: { error: e }
  # end

  def update
    #Update User
    user = UserService::UpdateUserService.new(params[:id], params[:username], params[:name], params[:email], params[:password], params[:password_confirmation], params[:bio], params[:account_ids]).call
    render json: { user: user}
  rescue StandardError => e
    render json: { error: e }, status: 400
  end

  def destroy
    user = UserService::DestroyUserService.new(params[:id]).call
    render json: {message: "User already deleted"}
  rescue StandardError => e
    render json: { error: e }
  end

end


