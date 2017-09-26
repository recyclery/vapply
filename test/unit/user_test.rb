require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Create User" do
    user = User.create(:email => "testuser@example.com", :password => "password")
    assert user.caseworker

    # Changing the caseworker email should change the user email too.
    c = user.caseworker

    c.email = "changedemail@example.com"
    c.save

    user = User.find_by_email("changedemail@example.com")
    assert user
  end
end
