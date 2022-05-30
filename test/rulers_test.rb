# frozen_string_literal: true

require "test_helper"

class RulersTest < Minitest::Test
  class TestApp < Rulers::Application; end
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_that_it_has_a_version_number
    refute_nil ::Rulers::VERSION
  end

  def test_request
    get "/"

    assert last_response.ok?
    assert_equal(
      "<h1>Welcome to your Ruby on Rulers Application!</h1>",
      last_response.body
    )
  end
end
