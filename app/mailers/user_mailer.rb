class UserMailer < ApplicationMailer

  def notify_inquiry(classified, recipient, poster)
    @classified = classified
    @recipient = recipient
    @poster = poster
    email_with_name = %w("#{recipient.first_name}" <#{recipient.email}>)
    mail(to: email_with_name, subject: "[CLS#{classified.id}] New inquiry regarding your ad")
  end

end
