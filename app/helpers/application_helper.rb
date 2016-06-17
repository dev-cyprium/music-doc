module ApplicationHelper
	def get_type(type)
		case type
		when 'alert' then return 'danger'
		when 'notice' then return 'success'
		end
	end

	def avatar_url(user, size=72)
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
	end
end
