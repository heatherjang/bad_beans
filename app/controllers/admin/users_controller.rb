class Admin::UsersController < ApplicationController

  before_filter :admin? 

  def index
    @users = User.all
  end

end
