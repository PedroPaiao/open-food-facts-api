class ErrorReport
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Enumerize

  enumerize :kind, in: %i[system importation], default: :system

  field :text, type: String

  after_create :send_notification

  private

  def send_notification
    NotifyMailer.error(self).deliver
  end
end
