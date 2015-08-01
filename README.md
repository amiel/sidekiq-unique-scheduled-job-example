# Sidekiq Unique Scheduled Job Example

This repository is to demonstrate mhenrixon/sidekiq-unique-jobs#93.

## Instructions to reproduce mhenrixon/sidekiq-unique-jobs#93

1. clone, bundle, etc

   ```shell
   git clone https://github.com/amiel/sidekiq-unique-scheduled-job-example.git
   cd sidekiq-unique-scheduled-job-example
   bundle
   ```

2. Start a console and a sidekiq worker

   ```shell
   # in one terminal
   bundle exec rails console

   # in another terminal
   bundle exec sidekiq
   ```

3. Enqueue jobs in sidekiq. Any number of arguments are accepted and logged.
   This way you can easily enqueue jobs that should be unique or match previous jobs.

   ```ruby
   MyWorker.perform_async 1
   # => jid
   MyWorker.perform_async 1
   # WARN: payload is not unique
   # => nil
   MyWorker.perform_in 1, 2
   # => jid
   ```

   Watch the server logs to see that the job runs when `perform_async` is called,
   but `WARN: payload is not unique` is logged when `perform_in` is called.

