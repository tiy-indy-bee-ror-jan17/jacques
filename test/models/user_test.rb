require 'test_helper'

class UserTest < ActiveSupport::TestCase

  should have_db_column :api_token

  should have_secure_password

  def test_it_generates_an_api_token
    user = FactoryGirl.build(:user, api_token: nil)
    assert user.api_token.blank?
    assert user.save
    refute user.api_token.blank?
  end

end
