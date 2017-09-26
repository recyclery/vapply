require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "recent" do
    client = clients(:one)
    # :one date is 2011-10-28 19:12:18
    assert_equal DateTime.parse("2011-10-28 19:12:18"), client.created_at
    assert_equal false, client.recent?(Date.parse("2011-10-29 23:55:17"))
    assert client.recent?(Date.parse("2011-10-26 23:55:17"))
  end

  test "complete" do
    client = clients(:one)
    assert_equal nil, client.completed_at
    assert_equal nil, client.is_completed?

    client.complete!
    assert client.is_completed?
  end

end
