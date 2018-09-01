class Commodity < ApplicationRecord
  has_and_belongs_to_many :trades
end
