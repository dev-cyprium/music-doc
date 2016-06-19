require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
  	@relationship = Relationship.create(following_id: 1, follower_id: 2)
  end

  test 'should be valid' do
  	assert @relationship.valid?
  end

  test 'should require following id' do
  	@relationship.following_id = nil
  	assert_not @relationship.valid?
  end

  test 'should require follower id' do
  	@relationship.follower_id = nil
  	assert_not @relationship.valid?
  end
end
