# Preview all emails at http://localhost:3000/rails/mailers/custom
class CustomPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/custom/test
  def test
    CustomMailer.test
  end

end
