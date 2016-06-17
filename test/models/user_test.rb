require 'test_helper'

class UserTest < ActiveSupport::TestCase
 	def setup
 		@user = User.new(email: 'test@example.com', password: 'password', 
 			password_confirmation: 'password', first_name: 'stefan', last_name: 'stefan')
 	end

 	test 'should be valid' do
 		assert @user.valid?
 	end

 	test 'first name should be present' do
 		@user.first_name = "    "
 		assert_not @user.valid?
 	end

 	test 'last name should be present' do
 		@user.last_name = "    "
 		assert_not @user.valid?
 	end	
end
