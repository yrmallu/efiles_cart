class CountryCode < ApplicationRecord
  has_many :users
  validates :code, presence: true, uniqueness: true
end
