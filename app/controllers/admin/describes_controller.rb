class Admin::DescribesController < ApplicationController
  before_action :admin_user

  def index
    @describes = Describe.where(lnappropriates_count: 5..Float::INFINITY)
  end

  def show
    @describe = Describe.find(params[:id])
  end

  def destroy
    @describe = Describe.find(params[:id])
    @describe.destroy
    redirect_to admin_describes_path
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
