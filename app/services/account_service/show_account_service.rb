class AccountService::ShowAccountService

  def initialize(id)
    @id = id
  end

  def call
    account = Account.find_by id: @id 
  end

end