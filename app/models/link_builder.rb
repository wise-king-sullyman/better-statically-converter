class LinkBuilder < ApplicationRecord
  validates :commit, presence: true
  validates :file, presence: true
end
