def available(time,user_id)
	@tutor_free = Timeslot.find_by(tutor_id: user_id, time: time, student_id: nil)
	@tutor_booked = Timeslot.find_by(tutor_id: user_id, time: time)

	if (@tutor_free.class == Timeslot)
		return  "Available for Tutoring"
	elsif(@tutor_booked.class == Timeslot)
		return "Tutoring #{@tutor_booked.student.name}"
	else
		return "Not available"
	end
end