class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :company

  scope :region_id, -> (region_id) { where region_id: region_id }
  scope :location, -> (location_id) { where location_id: location_id }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
end
