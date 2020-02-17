class Admin::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def admin_user
    if current_user
      redirect_to root_path unless current_user.admin?
    else
      redirect_to root_path
    end
  end
end
