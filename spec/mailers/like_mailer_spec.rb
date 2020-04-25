require "rails_helper"

RSpec.describe LikeMailer, type: :mailer do
  describe "like_blog" do
    let(:mail) { LikeMailer.like_blog }

    it "renders the headers" do
      expect(mail.subject).to eq("Like blog")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
