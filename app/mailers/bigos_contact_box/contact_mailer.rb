module BigosContactBox
class ContactMailer < ActionMailer::Base


  def custom_message(msg = nil)
    if msg != nil
      @message = msg
      mail(:to => BigosContactBox::Setting["#{BigosContactBox.name}.recipient"], :from => BigosContactBox::Setting["GS.mailer_user_name"], :subject => @message.subject)
    end
  end
  end
end