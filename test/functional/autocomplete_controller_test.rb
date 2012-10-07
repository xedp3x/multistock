require 'test_helper'

class AutocompleteControllerTest < ActionController::TestCase
  test "should get Index" do
    get :comments
    assert_response :success
  end

end
