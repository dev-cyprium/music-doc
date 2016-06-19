require 'test_helper'

class UserPageTest < ActionDispatch::IntegrationTest
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

 	test 'user page should not contain follow form' do
 		get user_path(@user)
 		assert_template 'users/show'
 		assert_select '#follow-form', 0
 	end

 	test 'other user page should contain follow form' do
 		get user_path(@other)
 		assert_template 'users/show'
 		assert_select '#follow-form', 1
 	end
end
