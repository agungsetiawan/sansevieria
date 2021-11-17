class Api::V1::AccountsController < ApiController

  def index
    # Index Account
    accounts = AccountService::IndexAccountService.new.call
    render json: { accounts: accounts }
  rescue StandardError => e
    render json: { error: e }
  end

  def create
    # Create Account 
    account = AccountService::CreateAccountService.new(params[:name]).call
    render json: { account: account }
  rescue StandardError => e
    render json: { error: e }, status: 400
  end

  def show
    #Show Account
    account = AccountService::ShowAccountService.new(params[:id]).call
    render json: {account: account}
  rescue StandardError => e 
    render json: { error: e }
  end

  def update
    #Update Account
    account = AccountService::UpdateAccountService.new(params[:id], params[:name]).call
    render json: {account: account}
  rescue StandardError => e 
    render json: { error: e }, status: 400
  end

  def destroy
    user = AccountService::DestroyAccountService.new(params[:id]).call
    render json: {message: "Account already deleted"}
  rescue StandardError => e
    render json: { error: e }
  end

end