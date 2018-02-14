# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'dj.log'))
