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

def cancel_button_as_tutor(timeslot)
	return   <<-HTML
  <form action="/timeslots/#{timeslot.id}" method="post">
   <input type="hidden" name="_method" value="DELETE">
  <input type="submit" value="Cancel Session" class="btn"/>
</form>
  HTML
	
end

def cancel_button_as_student(timeslot)
	return   <<-HTML
  <form action="/timeslots/#{timeslot.id}/remove_student" method="post">
   <input type="hidden" name="_method" value="PUT">
  <input type="submit" value="Remove Student" class="btn"/>
</form>
  HTML
	
end

def add_student(timeslot)
	return   <<-HTML
  <form action="/timeslots/#{timeslot.id}/add_student" method="get">
     <input type="hidden" name="time" value="#{timeslot.time}">
  <input type="submit" value="Add Student" class="btn"/>
</form>
  HTML
	
end

def pick_tutor(timeslot)
	return   <<-HTML
  <form action="/timeslots/be_student" method="get">
     <input type="hidden" name="time" value="#{timeslot}">
  <input type="submit" value="Pick Tutor" class="btn"/>
</form>
  HTML
	
end

def be_tutor(timeslot)
	return   <<-HTML
  <form action="/timeslots/new" method="post">
     <input type="hidden" name="time" value="#{timeslot}">
  <input type="submit" value="Be Tutor" class="btn"/>
</form>
  HTML
	
end