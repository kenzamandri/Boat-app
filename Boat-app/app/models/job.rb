class Job < ApplicationRecord
  has_and_belongs_to_many :boats

  validates :name, uniqueness: true, presence: true

  validates(:cost, numericality: {greater_than_or_equal_to: 1000})

   validates(:description, presence: true, length: {minimum: 50, message: 'Must be at least 3 characters.'})
end
