class ApplicationController < ActionController::API
  before_action :authenticate_api_key

  private

  def authenticate_api_key
    api_key = request.headers['X-Api-Key'] || params[:api_key]
    unless api_key && api_key == ENV['API_KEY']
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
