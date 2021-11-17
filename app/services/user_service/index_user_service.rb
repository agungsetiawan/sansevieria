class UserService::IndexUserService < ApplicationService

  def call
    User.all
  end
end
