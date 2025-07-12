class HealthMetric < ApplicationRecord
  validates :name, :date, :data, presence: true
  validates :name, uniqueness: { scope: :date, message: "should be unique per date" }

  serialize :data, coder: JSON

  # Custom getter and setter are no longer needed with this setup
end