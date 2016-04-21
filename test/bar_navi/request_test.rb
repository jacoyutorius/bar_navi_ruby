require_relative "../test_helper"

class BarNaviTest < Minitest::Test
  def setup
    @barnavi = BarNavi::Request.new(
      API_KEY,
      "jacoyutoriuses.com"
      )
  end

  # 初期化のテスト
  def test_apikey_invalid
    @barnavi = BarNavi::Request.new(
      "invalid_apikey",
      "jacoyutoriuses.com"
      )
    assert_raises(RuntimeError) do
      @barnavi.get
    end
  end

  # 検索結果のテスト
  def test_response
    response = @barnavi.get(preference: 22, address: "ぬい屋")
    assert_equal "オルガ", response["shops"]["shop"]["name_kana"]
  end
  def test_response_result_count
    response = @barnavi.get(preference: 22)
    assert_equal "1", response["shops"]["results_returned"]
  end

  # getメソッドに渡す引数のテスト
  def test_validation_error_for_preference
    assert_raises(RuntimeError) do
      @barnavi.get
    end
  end
end
