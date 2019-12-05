class DescribesController < ApplicationController
  before_action :set_id, only:[:show,:edit,:update,:destroy]

  def index
    @describes = Describe.all
  end

  def new
    @describe = Describe.new
  end

  def show
  end

  def edit
  end

  def create
    @describe = Describe.new(describe_params)
    if @describe.save
      redirect_to @describe, notice: '説明を投稿しました。'
    else
      render :new
    end
  end

  def update
    if @describe.update(describe_params)
      redirect_to @describe, notice: '説明を編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @describe.destroy
    redirect_to describes_path, notice: '説明を削除しました'
  end

  private

  def describe_params
    params.require(:describe).permit(:title, :content, {images: []})
  end

  def set_id
    @describe = Describe.find(params[:id])
  end
end
