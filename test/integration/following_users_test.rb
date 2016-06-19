require 'test_helper'

class FollowingUsersTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:stefan)
		@other = users(:zoran)
		# Sign the user in
		post user_session_path, 
			'user[email]' => @user.email,
			'user[password]' => 'password'
		assert_equal 'Signed in successfully.', flash[:notice]
		follow_redirect!
	end

	test 'should follow the user the standard way' do
		assert_difference '@user.following.count', 1 do
			post relationships_path, followed_id: @other.id
		end
	end

	test 'should follow a user with Ajax' do
		assert_difference '@user.following.count', 1 do
			xhr :post, relationships_path, followed_id: @other.id
		end
	end

	test 'should unfollow a user the standard way' do
		@user.follow(@other)
		relationship = Relationship.first
		assert_difference '@user.following.count', -1 do
			delete relationship_path(relationship), followed_id: @other.id
		end
	end

	test 'should unfollow a user with Ajax' do
		@user.follow(@other)
		relationship = Relationship.first
		assert_difference '@user.following.count', -1 do
			xhr :delete, relationship_path(relationship), followed_id: @other.id
		end
	end
end
