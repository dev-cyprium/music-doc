50.times do |index|
	u = User.new(
		first_name: "Name_#{index}", 
		last_name: "Exampling",
		email: "foo_bar#{index}@example.com",
		password: 'password',
		password_confirmation: 'password'
	)

	u.save
end