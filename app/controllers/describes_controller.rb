class DescribesController < ApplicationController
  before_action :set_id, only:  [:show, :edit, :update, :destroy]

  def index
    @describes = @q.result.original_describe.likes_count.page(params[:page]).per(10)
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
    @comments = @describe.comments.original_comment
    @comment = Comment.new
    all_describes = @describe.update_describes.reverse.push(@describe)
    @all_describes = Kaminari.paginate_array(all_describes).page(params[:page]).per(1)
  end

  def edit
    if user_signed_in?
      unless @describe.user_id == current_user.id
        redirect_to @describe, notice: '投稿者のみ編集できます'
      end
    else
      redirect_to @describe, notice: '投稿者のみ編集できます'
    end
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
    if user_signed_in?
      if @describe.user_id == current_user.id
        @describe.destroy
        redirect_to describes_path, notice: '説明を削除しました'
      else
        redirect_to @describe, notice: '投稿者のみ削除できます'
      end
    else
      redirect_to @describe, notice: '投稿者のみ削除できます'
    end
  end

  def contributions
    @my_q = current_user.describes.latest.ransack(params[:q])
    @describes = @my_q.result.original_describe.page(params[:page]).per(10)
  end

  private

  def describe_params
    params.require(:describe).permit(:title, :content, {images: []}, :original_id, { category_ids: [] }, { tag_ids: [] })
  end

  def set_id
    @describe = Describe.find(params[:id])
  end
end
