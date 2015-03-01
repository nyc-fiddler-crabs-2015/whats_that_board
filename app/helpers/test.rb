def timeslots_array
	array = ["10 AM", "11 AM", "12 PM", "1 PM", "2 PM", "3 PM", "4 PM", "5 PM"]
	return array
end

def current_user
	@user = User.find(session[:user_id])
	return @user
end


def my_open
	@timeslots = Timeslot.where(tutor_id: current_user.id).where(student_id: nil)
	return @timeslots
end


def other_open
	@timeslots = Timeslot.where.not(tutor_id: nil).where(student_id: nil).where.not(tutor_id: current_user.id)
	return @timeslots
end

def boooked_me_teach
	@timeslots = Timeslot.where(tutor_id: current_user.id).where.not(student_id: current_user.id).where.not(student_id: nil)
	return @timeslots
end

def boooked_me_student
	@timeslots = Timeslot.where(student_id: current_user.id).where.not(tutor_id: current_user.id).where.not(tutor_id: nil)
	return @timeslots
end

def check_status(time)
	@timeslot = Timeslot.find_by(student_id: current_user.id, time: time)
	@timeslot2 = Timeslot.find_by(student_id: current_user.id, time: time)
	if (@timeslot.class == Timeslot)
		return @timeslot
	else
		return false
	end


	 
end