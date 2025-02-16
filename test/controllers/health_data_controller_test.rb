require "test_helper"

class HealthDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health_datum = health_data(:one)
  end

  test "should get index" do
    get health_data_url, as: :json
    assert_response :success
  end

  test "should create health_datum" do
    assert_difference("HealthDatum.count") do
      post health_data_url, params: { health_datum: {} }, as: :json
    end

    assert_response :created
  end

  test "should show health_datum" do
    get health_datum_url(@health_datum), as: :json
    assert_response :success
  end

  test "should update health_datum" do
    patch health_datum_url(@health_datum), params: { health_datum: {} }, as: :json
    assert_response :success
  end

  test "should destroy health_datum" do
    assert_difference("HealthDatum.count", -1) do
      delete health_datum_url(@health_datum), as: :json
    end

    assert_response :no_content
  end
end
