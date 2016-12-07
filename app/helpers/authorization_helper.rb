module AuthorizationHelper

	def is_mission_owner
		if current_user.id == @mission.user_id
			true
		else
			false
		end
	end

	def is_submission_owner
		if current_user.id == @submission.user_id
			true
		else
			false
		end
	end

	def owner_will_submit
		if current_user.id == Mission.find(params[:mission_id]).user.id
			true
		else
			false
		end
	end

	# Mission.find(params[:mission_id]).user.id

end