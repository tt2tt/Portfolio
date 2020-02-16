class LnappropriatesController < ApplicationController
  def create
    @lnappropriate =  lnappropriate = current_user.lnappropriates.create(describe_id: params[:describe_id])
    @describe = Describe.find(params[:describe_id])
    redirect_to @describe, notice: '不適切な投稿を報告しました'
  end
end
