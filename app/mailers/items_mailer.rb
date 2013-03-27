class ItemsMailer < ActionMailer::Base
  default from: "do-not-reply@shoppit.com"

  def item_notification(user, item)
    @user = user
    @item = item

    mail(:to => user.email, :subject => "You've received a new Comment")
  end
end
