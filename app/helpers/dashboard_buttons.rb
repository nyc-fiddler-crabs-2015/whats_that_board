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