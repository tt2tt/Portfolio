class DescribesController < ApplicationController
  before_action :set_id, only:  [:show, :edit, :update, :destroy]
  # skip_before_action :set_id, only:[:users_index]

  def index
    @describes = @q.result
  end

  def new
    @describe = Describe.new
  end

  def show
    @like = current_user.likes.find_by(describe_id: @describe.id)
  end

  def edit
  end

  def create
    @describe = current_user.describes.build(describe_params)
    if @describe.save
      redirect_to @describe, notice: '説明を投稿しました'
    else
      render :new
    end
  end

  def update
    if @describe.update(describe_params)
      redirect_to @describe, notice: '説明を編集しました'
    else
      render :edit
    end
  end

  def destroy
    @describe.destroy
    redirect_to describes_path, notice: '説明を削除しました'
  end

  def contributions
    @q = current_user.describes.ransack(params[:q])
    @describes = @q.result
  end

  private

  def describe_params
    params.require(:describe).permit(:title, :content, {images: []})
  end

  def set_id
    @describe = Describe.find(params[:id])
  end
end
