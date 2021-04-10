class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "#{@picture.user.email}", subject: "Clone_IGに投稿しました"
  end
end
