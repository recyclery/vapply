require 'test_helper'

class CaseworkerTest < ActiveSupport::TestCase
  test "basic fixture" do
    casey = caseworkers(:one)
    assert_equal "Casey", casey.name
  end

  test "Add clients" do
    casey = caseworkers(:one)

    assert_equal 1, casey.clients.count
    assert_equal 3, casey.limit
    assert casey.can_add_clients?

    casey.clients.create(:name => "Test Client 2")

    assert_equal 2, casey.clients.count
    assert casey.can_add_clients?

    client3 = casey.clients.create(:name => "Test Client 3")

    assert_equal 3, casey.clients.count
    assert_equal false, casey.can_add_clients?

    client3.complete!
    assert_equal 3, casey.clients.count
    assert_equal 2, casey.clients.select {|c| not c.is_completed? }.count
    assert casey.can_add_clients?

    client4 = casey.clients.create(:name => "Test Client 4")
    assert_equal 4, casey.clients.count
    assert_equal 3, casey.clients.select {|c| not c.is_completed? }.count
    assert_equal false, casey.can_add_clients?

    casey.limit = 4
    assert casey.can_add_clients?

    casey.limit = 3
    client4.delete
    assert casey.can_add_clients?
  end
end
