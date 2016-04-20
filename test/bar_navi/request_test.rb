require_relative "../test_helper"

class BarNaviTest < Minitest::Test
  def setup
    @barnavi = BarNavi::Request.new(
      # "adbc9bdffc001062633f3bac9b2d25e436db34c4afe36b67f6171cdaee66f0eb",
      API_KEY,
      "jacoyutorius.com"
      )
  end
  def test_response
    response = @barnavi.get
    assert_equal "オルガ", response["shops"]["shop"]["name_kana"]
  end
end
