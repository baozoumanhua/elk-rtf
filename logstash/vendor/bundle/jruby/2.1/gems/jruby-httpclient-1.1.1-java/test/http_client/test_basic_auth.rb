require 'helper'

class BasicAuthTest < Test::Unit::TestCase
  def test_get_can_authenticate
    get = HTTP::Get.new("/protected")
    get.basic_auth("user", "Password")

    response = @client.execute(get)

    assert_equal("Logged In", response.body)
  end

  def setup
    @client = HTTP::Client.new(:default_host => "http://localhost:8080")
  end

  def teardown
    @client.shutdown
  end
end