class UserService::UpdateUserService
 
  attr_reader :id, :username, :name, :email, :password, :password_confirmation, :bio, :account_ids
  def initialize(id, username, name, email, password, password_confirmation, bio, account_ids)
    @id = id
    @username = username
    @name = name
    @email = email
    @password = password
    @password_confirmation = password_confirmation
    @bio = bio
    @account_ids = account_ids
  end

  def call
    user = User.find_by id: id
    uname = user.username
    prev_user = User.find_by username: username
    raise StandardError, 'Username already exists' if prev_user.present? && username != uname
    user.update(id: id, username: username, name: name, email: email, password: password, password_confirmation: password_confirmation, bio: bio, account_ids: account_ids)
    user
  end
end

