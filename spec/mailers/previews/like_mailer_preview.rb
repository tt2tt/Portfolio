# Preview all emails at http://localhost:3000/rails/mailers/like_mailer
class LikeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/like_mailer/like_blog
  def like_blog
    LikeMailer.like_blog
  end

end
