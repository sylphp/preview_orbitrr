module AuthorizationHelper

	def is_mission_owner
		if current_user.id == @mission.user_id
			true
		else
			false
		end
	end

end