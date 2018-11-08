

namespace :tradeset do
  include Delayed::RecurringJob
  task :todo => :environment do
  run_every 10.seconds
  timezone 'US/Pacific'
  queue 'slow-jobs'

  def perform
    Trade.each do |t|
      t.tradeset
      t.save
    end
  end
end
end
