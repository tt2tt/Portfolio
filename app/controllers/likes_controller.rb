class LikesController < ApplicationController
  def create
    if @like = current_user.likes.create(describe_id: params[:describe_id])
      @describe = Describe.find(params[:describe_id])
      respond_to do |format|
        format.js { render :like }
      end
    end
  end

  def destroy
    if like = current_user.likes.find_by(id: params[:id]).destroy
      @describe = Describe.find(params[:describe_id])
      @like = nil
      respond_to do |format|
        format.js { render :like }
      end
    end
  end
end
