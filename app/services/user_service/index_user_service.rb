class UserService::IndexUserService

  def call
    User.all
  end
end
