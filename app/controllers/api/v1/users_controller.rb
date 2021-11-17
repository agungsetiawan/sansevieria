class Api::V1::UsersController < ApiController
  skip_before_action :authentication_access_token, only: :create

  def index
    # Index User
    users = UserService::IndexUserService.new.call
    render json: { users: users }
  rescue StandardError => e
    render json: { error: e }
  end

  def create
    # Create User
    user = UserService::CreateUserService.new(params[:username], params[:name], params[:email], params[:password], params[:password_confirmation], params[:bio]).call
    render json: { user: user }
  rescue StandardError => e
    render json: { error: e }
  end

end


