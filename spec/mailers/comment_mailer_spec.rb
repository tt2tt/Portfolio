require "rails_helper"

RSpec.describe CommentMailer, type: :mailer do
  subject { CommentMailer.comment_mail("aaa@aaa.com", "タイトル").deliver }

  it "コメント投稿時のメール送信機能の作成" do
    expect { subject }.to change(ActionMailer::Base.deliveries, :count).by(1)
  end

  it "コメント投稿時のメール内容のテスト" do
    mail = subject

    expect(mail.from[0]).to eq 'from@example.com'
    expect(mail.to[0]).to eq 'aaa@aaa.com'
    expect(mail.subject).to eq 'あなたの投稿にコメントがありました。'
    expect(mail.body).to include 'タイトルにコメントがありました。'
  end
end
