class CommentMailer < ApplicationMailer

  def comment_mail(mail, describe)
    @mail = mail
    @describe = describe

    mail to: "#{@mail}", subject: "あなたの投稿にコメントがありました。"
  end

end
