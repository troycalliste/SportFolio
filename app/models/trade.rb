class Trade < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :companies

  scope :region_id, -> (region_id) { where region_id: region_id }
  scope :location, -> (location_id) { where location_id: location_id }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
end
