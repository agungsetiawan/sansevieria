class UserService::UpdateUserService
 
  attr_reader :id, :username, :name, :email, :password, :password_confirmation, :bio
  def initialize(id, username, name, email, password, password_confirmation, bio)
    @id = id
    @username = username
    @name = name
    @email = email
    @password = password
    @password_confirmation = password_confirmation
    @bio = bio
  end

  def call
    user = User.find_by id: id
    uname = user.username
    prev_user = User.find_by username: username
    raise StandardError, 'Username already exists' if prev_user.present? && username != uname
    user.update(id: id, username: username, name: name, email: email, password: password, password_confirmation: password_confirmation, bio: bio)
    user
  end
end

