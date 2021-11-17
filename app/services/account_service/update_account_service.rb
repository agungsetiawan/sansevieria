class AccountService::UpdateAccountService
  attr_reader :id, :name
  def initialize(id, name)
    @id = id
    @name = name
  end

  def call
    account = Account.find_by id: id
    account_name = account.name
    prev_account = Account.find_by name: name
    raise StandardError, 'Account Name already exists' if prev_account.present? && name != account_name
    account.update(id: id, name: name)
    account
  end
end
