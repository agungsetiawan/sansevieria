class InvitationService::CreateInvitationService

  attr_reader :inviter, :email, :account_id
  def initialize(inviter, email, account_id)
    @inviter = inviter
    @email = email
    @account_id = account_id
  end

  def call

    #get valid email for inviting
    invite_user = User.find_by email: email 
    raise StandardError, 'Email address is not registered yet' if invite_user.nil?
    user_id = invite_user.id

    #filter account, only account owned by current user
    user_account = inviter.user_accounts.where(account_id: account_id)
    raise StandardError, 'Account not owned by user' if user_account.empty?

    user_accs = UserAccount.new(user_id: user_id, account_id: account_id)
    user_accs.save
    user_accs

  end

end
    
