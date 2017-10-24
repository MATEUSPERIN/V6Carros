class MailerMailer < ApplicationMailer
    def create_email(locacao)
        @locacao = locacao
        mail(to: @cliente.email, subject: "Seus dados foram alterados")
    end
end
