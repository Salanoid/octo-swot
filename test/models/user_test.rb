require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(email: 'john@example.com', password: '123456789')
    assert user.valid?
  end

  test 'invalid without email' do
    user = User.new(password: '123456789')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end
end
