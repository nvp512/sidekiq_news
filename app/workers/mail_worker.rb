class MailWorker
  include Sidekiq::Worker
  # sidekiq_options queue: :event_fun

  def perform(id)
    user = User.find(id)
    UserMailer.welcome_email(user).deliver_later
  end
end
