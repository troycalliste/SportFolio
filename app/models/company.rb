require 'rest-client'
require 'json'
# Refresh the cached action_methods when a new action_method is added.
class Company < ApplicationRecord
 has_many :trades
end
