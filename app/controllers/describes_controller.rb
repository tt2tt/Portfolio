class DescribesController < ApplicationController
  before_action :set_id, only:  [:show, :edit, :update, :destroy]

  def index
    @describes = @q.result.where(original_id: nil).page(params[:page]).per(10)
  end

  def new
    if params[:original]
      @original = Describe.find(params[:original])
    end
    @describe = Describe.new
  end

  def show
    if user_signed_in?
     @like = current_user.likes.find_by(describe_id: @describe.id)
     @comment = current_user.comments.build
   end
    @comments = @describe.comments.where(reply_comment_id: nil)
    @comment = Comment.new
    all_describes = @describe.update_describes.reverse.push(@describe)
    @all_describes = Kaminari.paginate_array(all_describes).page(params[:page]).per(1)
  end

  def edit
  end

  def create
    @describe = current_user.describes.build(describe_params)
    if @describe.save
      if @describe.original_id
        @original = Describe.find(@describe.original_id)
        redirect_to @original, notice: '説明を更新しました'
      else
        redirect_to @describe, notice: '説明を投稿しました'
      end
    else
      render :new
    end
  end

  def update
    if @describe.update(describe_params)
      if @describe.original_id
        @original = Describe.find(@describe.original_id)
        redirect_to @original, notice: '説明を編集しました'
      else
        redirect_to @describe, notice: '説明を編集しました'
      end
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
    @describes = @my_q.result.where(original_id: nil).page(params[:page]).per(10)
  end

  private

  def describe_params
    params.require(:describe).permit(:title, :content, {images: []}, :original_id)
  end

  def set_id
    @describe = Describe.find(params[:id])
  end
end
