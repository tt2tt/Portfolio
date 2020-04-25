class LikeMailer < ApplicationMailer

  def like_mail(mail, describe)
    @mail = mail
    @describe = describe

    mail to: "#{@mail}", subject: "あなたの投稿にいいねがありました。"
  end
end
