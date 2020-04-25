class LikesController < ApplicationController
  def create
    if user_signed_in?
      if @like = current_user.likes.create(describe_id: params[:describe_id])
        @describe = Describe.find(params[:describe_id])
        if @describe.user.receive == true
          LikeMailer.like_mail(@describe.user.email, @describe.title).deliver_later
        end
        respond_to do |format|
          format.html { redirect_to describe_path(@describe)}
          format.js { render :like }
        end
      end
   else
     redirect_to new_user_session_path
   end
  end

  def destroy
    if like = current_user.likes.find_by(id: params[:id]).destroy
      @describe = Describe.find(params[:describe_id])
      @like = nil
      respond_to do |format|
        format.html { redirect_to describe_path(@describe)}
        format.js { render :like }
      end
    end
  end
end
