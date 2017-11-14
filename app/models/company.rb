#name string that is between 2 and 255 characters.
#trial_status date that tells us when trial expires.
#plan_level string that indicates what type of account this is
class Company < ApplicationRecord
  validates_length_of :name, maximum: 255, minimum: 2
  validates_inclusion_of :plan_level, in: ["legacy", "custom", "basic", "plus", "growth", "enterprise"]
  validates_presence_of :plan_level

  has_many :lessons

  scope :alphabetical, lambda {
    order("name asc")
  }
end
