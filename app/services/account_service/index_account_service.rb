class AccountService::IndexAccountService
  def call
    Account.all
  end

end
