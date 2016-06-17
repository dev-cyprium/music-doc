module ApplicationHelper
	def get_type(type)
		case type
		when 'alert' then return 'danger'
		when 'notice' then return 'success'
		end
	end
end
