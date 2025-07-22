class MetricPresentation < ApplicationRecord
  validates :metric_name, presence: true, uniqueness: true
  validates :title, presence: true
  validates :chart_type, presence: true
  
  # Assuming chart_type is stored as a string, we can validate against allowed types
  validates :chart_type, inclusion: { in: %w[line bar area point arc gauge stacked_line blood_pressure] }

  # Optional fields
  validate :color_palette_is_valid_json
  validates :lambda, presence: true, if: -> { color_palette.present? }

  # Scopes
  scope :active, -> { where(active: true) }

  # Instance methods

  # Returns a parsed color palette array or nil
  def parsed_color_palette
    JSON.parse(color_palette) if color_palette.present?
  rescue JSON::ParserError
    nil
  end

  # Returns a callable lambda function or nil
  def lambda_function
    eval(lambda) if lambda.present?
  rescue StandardError
    nil
  end

  # Class methods

  # Finds or creates a default presentation for a given metric name
  def self.find_or_create_default(metric_name)
    find_or_create_by(metric_name: metric_name) do |presentation|
      presentation.title = metric_name.titleize
      presentation.chart_type = 'line'
      presentation.active = true
    end
  end

  private

  def color_palette_is_valid_json
    JSON.parse(color_palette) if color_palette.present?
  rescue JSON::ParserError
    errors.add(:color_palette, "must be valid JSON")
  end
end