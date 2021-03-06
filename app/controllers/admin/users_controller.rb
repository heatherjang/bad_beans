class Admin::UsersController < ApplicationController

  before_filter :restrict_access
  before_filter :admin?

  def index
    @users = User.all.page(params[:page]).per(10)
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def become
    return unless current_user.admin?
    
  end

end
