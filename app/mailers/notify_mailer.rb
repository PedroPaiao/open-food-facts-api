class NotifyMailer < ApplicationMailer
  def error(error_report)
    @text = error_report.text
    @kind_text = I18n.t("notify_mailer.error.kind_text.#{error_report.kind}")

    mail to: 'codeesh@exame.org', subject: I18n.t('notify_mailer.subject')
  end
end
