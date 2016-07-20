require 'test_helper'

class SessionHelperTest < ActionView::TestCase

  include SessionsHelper

  test 'check role present' do
    user = users(:user_1)
    session[:user_id] = user.id
    session[:roles] = [:admin,:user]

    assert(has_role?(:admin), 'Expected role not found.')

    assert(!has_role?(:tealady), 'Unexpected role found.')
  end
end