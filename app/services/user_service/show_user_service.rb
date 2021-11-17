class UserService::ShowUserService < ApplicationService

  def initialize(id)
    @id = id
  end

  def call
    user = User.find_by id: @id
  end

end
