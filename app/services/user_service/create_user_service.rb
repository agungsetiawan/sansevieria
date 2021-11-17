class UserService::CreateUserService
 
  attr_reader :username, :name, :email, :password, :password_confirmation, :bio, :account_ids
  def initialize(username, name, email, password, password_confirmation, bio, account_ids)
    @username = username
    @name = name
    @email = email
    @password = password
    @password_confirmation = password_confirmation
    @bio = bio
    @account_ids = account_ids
  end

  def call
    prev_user = User.find_by username: username
    raise StandardError, 'Username already exists' if prev_user.present?

    user = User.new(username: username, name: name, email: email, password: password, password_confirmation: password_confirmation, bio: bio, account_ids: account_ids)
    user.access_token = user.generate_token
    user.save
    user

  end
end

