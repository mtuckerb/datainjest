class HealthDataController < ApplicationController
  before_action :set_health_datum, only: %i[ show update destroy ]

  # GET /health_data
  def index
    @health_data = HealthDatum.all

    render json: @health_data
  end

  # GET /health_data/1
  def show
    render json: @health_datum
  end

  def sum(metric)
     metric[:data].sum do |m|
        m[:qty] || 0
      end
  end

  def average(metric)
    return 0 unless metric.dig(:data)
      sum(metric) / metric.dig(:data).size
  end

  def total(metric) 
    return unless metric.dig(:name)
    case metric.dig(:name)
    when "apple_stand_hour"
      sum(metric)
    when "apple_exercise_time"
      sum(metric)
    when "flights_climbed"
      sum(metric)
    when "vo2_max"
      average(metric)
    when "stair_speed_down"
      average(metric)
    when  "headphone_audio_exposure"
      average(metric)
    when "stair_speed_up"
      average(metric)
    when "heart_rate_variability"
      average(metric)
    when "apple_stand_time"
      sum(metric)
    when "walking_step_length"
      average(metric)
    when "walking_double_support_percentage"
      average(metric)
    when "blood_oxygen_saturation"
      average(metric)
    when "environmental_audio_exposure"
      average(metric)
    when "walking_speed"
      average(metric)
    when "walking_running_distance"
      sum(metric)
    when "time_in_daylight"
      sum(metric)
    when "step_count"
      sum(metric)
    when "resting_heart_rate"
      average(metric)
    when "walking_heart_rate_average"
      average(metric)
    when "active_energy"
      sum(metric)
    when "basal_energy_burned"
      sum(metric)
    when "physical_effort"
      sum(metric)
    end
  end

  # POST /health_data
  def create
    @health_datum = HealthDatum.new(health_datum_params)
    metrics = JSON.parse(request.env["RAW_POST_DATA"]).with_indifferent_access.dig(:data, :metrics)
    summary = metrics .map do |metric| 
          "#{metric[:name]}: #{total(metric)}"
    end
    date = Date.parse(metrics.first.dig("data").first.dig("date"))
    summary.push("created: #{date.strftime("%Y-%m-%d")}")

    directory = date&.strftime("%Y/%m/%d/")
    filepath = date&.strftime("#{directory}/health_data.md")
    FileUtils.mkdir_p(directory)
    File.write("/data/vimwiki/knowledgebase/#{filepath}", "---\n#{summary.join("\n")}\n---\n")

    if @health_datum.save
      render json: @health_datum, status: :created, location: @health_datum
    else
      render json: @health_datum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /health_data/1
  def update
    if @health_datum.update(health_datum_params)
      render json: @health_datum
    else
      render json: @health_datum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /health_data/1
  def destroy
    @health_datum.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_datum
      @health_datum = HealthDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def health_datum_params
      params.fetch(:health_datum, {})
    end
end
