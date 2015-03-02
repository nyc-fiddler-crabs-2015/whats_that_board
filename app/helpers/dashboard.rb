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

def check_status(time,user_id)
	@learning = Timeslot.find_by(student_id: user_id, time: time)
	@tutor_free = Timeslot.find_by(tutor_id: user_id, time: time, student_id: nil)
	@tutor_booked = Timeslot.find_by(tutor_id: user_id, time: time)
	if (@learning.class == Timeslot)
		return "Learning with #{@learning.tutor.name}"
	elsif (@tutor_free.class == Timeslot)
		return  "Tutoring no one yet"
	elsif(@tutor_booked.class == Timeslot)
		return "Tutoring #{@tutor_booked.student.name}"
	else
		return "Free"
	end
	 
end

def place_buttons(time,user_id)
	@learning = Timeslot.find_by(student_id: user_id, time: time)
	@tutor_free = Timeslot.find_by(tutor_id: user_id, time: time, student_id: nil)
	@tutor_booked = Timeslot.find_by(tutor_id: user_id, time: time)
	if (@learning.class == Timeslot)
		return cancel_button_as_tutor(@learning)
	elsif (@tutor_free.class == Timeslot)
		return add_student(@tutor_free) + cancel_button_as_tutor(@tutor_free)
	elsif(@tutor_booked.class == Timeslot)
		return cancel_button_as_student(@tutor_booked)
	else
		return pick_tutor(time) + be_tutor(time)
	end
end
