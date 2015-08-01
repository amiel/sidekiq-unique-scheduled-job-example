class MyWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, unique: true, log_duplicate_payload: true

  def perform(*args)
    Sidekiq.logger.warn "MyWorker#perform(#{args.inspect})"
  end
end
