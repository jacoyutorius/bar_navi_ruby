require_relative "../test_helper"

class BarNaviTest < Minitest::Test
  def setup
    @barnavi = BarNavi::Request.new(
      API_KEY,
      "jacoyutorius.com"
      )
  end
  def test_response
    response = @barnavi.get(preference: 22)
    assert_equal "オルガ", response["shops"]["shop"]["name_kana"]
  end
  def test_validation_error_for_API_key
    response = @barnavi.get
    assert_raises ""
  end
  def test_validation_error_for_call_url
  end
  def test_validation_error_for_pattern
  end
  def test_validation_error_for_preference
  end
end
