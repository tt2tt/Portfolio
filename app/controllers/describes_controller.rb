class DescribesController < ApplicationController
  before_action :set_id, only:  [:show, :edit, :update, :destroy]

  PER = 20

  def index
    @describes = @q.result.page(params[:page]).per(PER)
  end

  def new
    @describe = Describe.new
  end

  def show
    if user_signed_in?
     @like = current_user.likes.find_by(describe_id: @describe.id)
     @comment = current_user.comments.build
   end
    @comments = @describe.comments.where(reply_comment_id: nil)
    # binding.pry
    @comment = Comment.new
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
    @my_q = current_user.describes.ransack(params[:q])
    @describes = @my_q.result.page(params[:page]).per(PER)
  end

  private

  def describe_params
    params.require(:describe).permit(:title, :content, {images: []})
  end

  def set_id
    @describe = Describe.find(params[:id])
  end
end
