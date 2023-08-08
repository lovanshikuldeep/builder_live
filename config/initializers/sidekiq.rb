require 'sidekiq/api'
require 'sidekiq/cron'

Sidekiq::Cron::Job.create(
  name: 'Perform Job Every Minute',
  cron: '* * * * *', # Runs every minute
  class: 'AppointmentJob'
)