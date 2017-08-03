class RequestMailer < ApplicationMailer
  default from: 'IOU App <ioumoneyapp@gmail.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.received.subject
  #
  def received(request, debtor)
    @request = request
    @debtor = debtor

    mail to: debtor.email
  end
end
