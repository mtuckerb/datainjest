class MetricPresentation < ApplicationRecord
  validates :metric_name, presence: true, uniqueness: true
  validates :chart_type, presence: true

  def target_range_check(value)
    return true if lambda.blank?
    
    begin
      eval(lambda).call(value)
    rescue => e
      Rails.logger.error "Error evaluating lambda for #{metric_name}: #{e.message}"
      false
    end
  end
end