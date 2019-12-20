class CommentsController < ApplicationController
  def create
    @describe = Describe.find(params[:describe_id])
    @comment = current_user.comments.build(comment_params)
    @comment.describe_id = @describe.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
        CommentMailer.comment_mail(current_user.email, @describe.title).deliver
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
