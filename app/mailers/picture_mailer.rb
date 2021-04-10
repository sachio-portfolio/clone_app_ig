class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "#{ENV['TO_EMAIL']}", subject: "Clone_IGに投稿しました"
  end
end
