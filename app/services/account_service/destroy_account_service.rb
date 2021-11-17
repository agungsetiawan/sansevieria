class AccountService::DestroyAccountService

  def initialize(id)
    @id = id
  end

  def call
    account = Account.find_by id: @id
    account.destroy
  end

end