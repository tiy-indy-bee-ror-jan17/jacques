class SleepJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sleep args.first
  end
end
