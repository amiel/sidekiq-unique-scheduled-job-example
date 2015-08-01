class ScheduledWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, unique: true, log_duplicate_payload: true

  def perform(*args)
    Rails.logger.info "ScheduledWorker#perform(#{args.inspect})"
  end
end
