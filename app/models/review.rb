class Review < ApplicationRecord
  belongs_to :list

  validates :comment, presence: true, length: {minimum: 5}
  validates :rating, presence: true, numericality: {greater_than: -1, smaller_than: 6}
end
