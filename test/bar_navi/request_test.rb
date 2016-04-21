require_relative "../test_helper"

class BarNaviTest < Minitest::Test
  def setup
    @barnavi = BarNavi::Request.new(
      API_KEY,
      "jacoyutorius.com"
      )
  end

  # 初期化のテスト
  def test_invalid_apikey
    @barnavi = BarNavi::Request.new(
      "invalid_apikey",
      "jacoyutorius.com"
      )
    assert_raises(BarNavi::Errors::APIError) do
      @barnavi.get(preference: 22)
    end
  end

  # 検索結果のテスト
  def test_response
    response = @barnavi.get(preference: 22, address: "ぬい屋ビル")
    assert_equal "オルガ", response["shops"]["shop"]["name_kana"]
  end

  def test_response_result_count
    response = @barnavi.get(preference: 22, address: "ぬい屋ビル")
    assert_equal "1", response["shops"]["results_returned"]
  end

  def test_response_latitude_longitude
    response = @barnavi.get(preference: 22, pattern: 1, logger: true, latitude: "34.706963", longitude: "137.730154")
    assert_equal "10", response["shops"]["results_returned"]
  end

  # getメソッドに渡す引数のテスト
  def test_validation_error_for_preference
    assert_raises(BarNavi::Errors::PreferenceNotFound) do
      @barnavi.get
    end
  end
end
