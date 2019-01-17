class NotificationMailer < ApplicationMailer
  def send_confirmation_when_comment_created(blog, entry, comment)
    @blog = blog
    @entry = entry
    @comment = comment
    mail(
      subject: "新しいコメントが登録されました。",
      from: "on_boarding@test.com",
      to: "test@example.com"
    ) do |format|
      format.text
    end
  end

  def send_confirmation_to_user(user)
    @user = user
    mail(
      subject: "会員登録が完了しました。",
      from: 'on_boarding@test.com',
      to: "hogehoge@test.com"
    ) do |format|
      format.text
    end
  end

end
