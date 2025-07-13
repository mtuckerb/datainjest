# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

MetricPresentation.create!([
  {
    metric_name: 'step_count',
    chart_type: 'arc',
    lambda: 'lambda { |x| x > 8000 }',
    color_palette: '["#ff0000", "#ffff00", "#00ff00"]',
    title: 'Daily Step Count'
  },
  {
    metric_name: 'blood_pressure',
    chart_type: 'line',
    lambda: 'lambda { |x| x.systolic.between?(90, 120) && x.diastolic.between?(60, 80) }',
    color_palette: '["#0000ff", "#ff0000"]',
    title: 'Blood Pressure'
  },
  {
    metric_name: 'walking_heart_rate_average',
    chart_type: 'arc',
    lambda: 'lambda { |x| x.between?(85, 120) }',
    color_palette: '["#ff0000", "#ffff00", "#00ff00", "#ffff00", "#ff0000"]',
    title: 'Walking Heart Rate'
  },
  {
    metric_name: 'resting_heart_rate',
    chart_type: 'arc',
    lambda: 'lambda { |x| x.between?(55, 80) }',
    color_palette: '["#ff0000", "#ffff00", "#00ff00", "#ffff00", "#ff0000"]',
    title: 'Resting Heart Rate'
  },
  {
    metric_name: 'weight_body_mass',
    chart_type: 'gauge',
    lambda: 'lambda { |x| x <= 145 }',
    color_palette: '["#0000ff", "#00ff00"]',
    title: 'Body Weight'
  },
  {
    metric_name: 'apple_exercise_time',
    chart_type: 'arc',
    lambda: 'lambda { |x| x < 30 }',
    color_palette: '["#ff0000", "#ffff00", "#00ff00"]',
    title: 'Daily Exercise Time'
  },
  {
    metric_name: 'blood_oxygen_saturation',
    chart_type: 'arc',
    lambda: 'lambda { |x| x > 95 }',
    color_palette: '["#ff0000", "#ffff00", "#00ff00"]',
    title: 'Blood Oxygen Saturation'
  }
])

# Add this to your seeds file or create a separate rake task

default_presentations = [
  { metric_name: 'weight_body_mass', chart_type: 'line', title: 'Weight', color_palette: '["#66c2a5", "#fc8d62"]', lambda: 'lambda { |value| value > 150 }' },
  { metric_name: 'blood_pressure', chart_type: 'line', title: 'Blood Pressure' },
  # Add more default presentations for your other metrics
]

default_presentations.each do |presentation|
  MetricPresentation.find_or_create_by!(metric_name: presentation[:metric_name]) do |p|
    p.attributes = presentation
  end
end