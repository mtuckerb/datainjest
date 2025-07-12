require 'vega'
class HealthDataController < ApplicationController
  before_action :set_health_metric, only: %i[ show update destroy ]

  # GET /health_data
  def index
    @health_metrics = HealthMetric.all
    render json: @health_metrics
  end

  # GET /health_data/1
  def show
    render json: @health_metric
  end

  # POST /health_data
  def create
    metrics = JSON.parse(request.body.read).with_indifferent_access.dig(:data, :metrics)
    date = Date.parse(metrics.first.dig("data").first.dig("date"))

    ActiveRecord::Base.transaction do
      metrics.each do |metric|
        metric[:data].each do |data_point|
          health_metric = HealthMetric.find_or_initialize_by(
            name: metric[:name],
            date: DateTime.parse(data_point[:date])
          )
          health_metric.data = data_point.except(:date)
          health_metric.save!
        end
      end
    end

    HealthDataFileService.new(date).create_files

    render json: { message: "Health data created or updated successfully" }, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /health_data/1
  def update
    if @health_metric.update(health_metric_params)
      render json: @health_metric
    else
      render json: @health_metric.errors, status: :unprocessable_entity
    end
  end

  # DELETE /health_data/1
  def destroy
    @health_metric.destroy!
  end

  private

  def set_health_metric
    @health_metric = HealthMetric.find(params[:id])
  end

  def health_metric_params
    params.require(:health_metric).permit(:name, :date, data: {})
  end
end