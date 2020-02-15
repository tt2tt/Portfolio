class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = current_user.tags.build(tag_params)
    @tag.save
    redirect_to describes_path, notice: 'タグを投稿しました'
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
