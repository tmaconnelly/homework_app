#name string that is between 2 and 255 characters.
#trial_status date that tells us when trial expires.
#plan_level string that indicates what type of account this is
class Company < ApplicationRecord
  ALL_PLANS = ["legacy", "custom", "basic", "plus", "growth", "enterprise"]
  MODERN_PLANS = ["basic", "plus", "growth", "enterprise"]

  validates_length_of :name, maximum: 255, minimum: 2
  validates_inclusion_of :plan_level, in: ALL_PLANS
  validates_presence_of :plan_level

  has_many :lessons

  scope :alphabetical, lambda {
    order("name asc")
  }

  scope :with_modern_plan, lambda {
    where(plan_level: MODERN_PLANS)
  }

  scope :not_trialing, lambda {
    where("trial_status IS NULL OR trial_status < ?", Time.zone.now)
  }

  scope :created_last_month, lambda {
    last_month = Time.zone.now - 1.month
    where("created_at BETWEEN ? AND ?", last_month.at_beginning_of_month, last_month.at_end_of_month)
  }
end
