class Admin::CategoriesController < ApplicationController
  before_action :admin_user

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_admin_category_path, notice: 'カテゴリーを作成しました'
    else
      redirect_to new_admin_category_path
    end

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def admin_user
    if current_user
      redirect_to root_path unless current_user.admin?
    else
      redirect_to root_path
    end
  end
end
