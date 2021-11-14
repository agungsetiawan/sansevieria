class UserService::IndexUserService < ApplicationService
  def initialize
  end

  def call
    User.all
  end
end
