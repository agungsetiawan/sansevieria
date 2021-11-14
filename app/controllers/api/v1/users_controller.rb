class Api::V1::UsersController < ApiController

  def index
    begin
      ActiveRecord::Base.transaction do
        # Index User
        users = UserService::IndexUserService.call
        render json: { users: users }
      end
    rescue StandardError => e
      render json: { error: e }
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        # Create User
        user = UserService::CreateUserService.new(params[:username], params[:name], params[:email], params[:password], params[:password_confirmation], params[:bio]).call
        render json: { user: user }
      end
    rescue StandardError => e
      render json: { error: e }
    end
  end

end


