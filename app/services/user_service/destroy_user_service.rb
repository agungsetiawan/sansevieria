class UserService::DestroyUserService

  def initialize(id)
    @id = id
  end

  def call
    user = User.find_by id: @id
    user.destroy
  end

end
