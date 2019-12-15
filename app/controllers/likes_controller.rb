class LikesController < ApplicationController
  def create
    like = current_user.likes.create(describe_id: params[:describe_id])
    redirect_to describes_path
  end

  def destroy
    favorite = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to describes_path
  end
end
