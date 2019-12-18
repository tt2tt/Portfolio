class CommentsController < ApplicationController
  def create
    @describe = Describe.find(params[:describe_id])
    # @comment = @describes.comments.build(comment_params)
    @comment = current_user.comments.build(comment_params)
    @comment.describe_id = @describe.id
    # binding.pry
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to describe_path(@describes), notice: '投稿できませんでした' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:describe_id, :content)
  end
end
