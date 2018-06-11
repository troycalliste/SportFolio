class Region < ApplicationRecord
  has_many :exchanges
  has_many :trades
end
