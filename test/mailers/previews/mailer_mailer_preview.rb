class MailerMailerPreview < ActionMailer::Preview
    def update_email
        MailerMailer.update_email(Mailer.first, Mailer.last)
    end
end
