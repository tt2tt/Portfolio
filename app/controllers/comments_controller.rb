class CommentsController < ApplicationController
  def create
    if user_signed_in?
      @describe = Describe.find(params[:describe_id])
      @comment = current_user.comments.build(comment_params)
      @comment.describe_id = @describe.id
      respond_to do |format|
        if @comment.save
          format.html { redirect_to describe_path(@describe)}
          format.js { render :index }
          if @describe.user.receive == true
            CommentMailer.comment_mail(@describe.user.email, @describe.title).deliver_later
          end
        else
          format.html { redirect_to describe_path(@describes), notice: '投稿できませんでした' }
        end
      end
    else
      redirect_to new_user_session_path
   end
  end

  private

  def comment_params
    params.require(:comment).permit(:describe_id, :content, :comment_number, :reply_comment_id)
  end
end
