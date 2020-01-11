class CommentMailer < ApplicationMailer

  def comment_mail(mail, comment)
    @mail = mail
    @comment = comment

    mail to: "#{@mail}", subject: "あなたの投稿にコメントがありました。"
  end

end
