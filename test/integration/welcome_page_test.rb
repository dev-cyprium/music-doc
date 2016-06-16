require 'test_helper'

class WelcomePageTest < ActionDispatch::IntegrationTest
	test "root path renders welcome/index template" do
		get root_path
		assert_template 'welcome/index'
		# TODO: ADD Tests for links when links are ready ( missing links )
	end
end
