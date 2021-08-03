require "test_helper"

class CmeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cme = cme(:one)
  end

  test "should get index" do
    get cme_url, as: :json
    assert_response :success
  end
end
