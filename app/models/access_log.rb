class AccessLog < ApplicationRecord
  belongs_to :vehicle
  belongs_to :visitor, optional: true
  validates :entry_time, presence: true
end
