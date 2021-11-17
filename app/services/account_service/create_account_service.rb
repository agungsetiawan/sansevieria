class AccountService::CreateAccountService
 
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def call
    prev_account = Account.find_by name: name
    raise StandardError, 'Account name already exists' if prev_account.present?
    account = Account.new(name: name)
    account.save
    account

  end
end

