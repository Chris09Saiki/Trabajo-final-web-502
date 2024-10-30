require "test_helper"

class ProveedoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get proveedores_index_url
    assert_response :success
  end
end
