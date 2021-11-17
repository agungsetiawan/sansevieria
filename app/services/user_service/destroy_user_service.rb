class UserService::DestroyUserService < ApplicationService

  def initialize(id)
    @id = id
  end

  def call
    user = User.find_by id: @id
    user.destroy
  end

end
