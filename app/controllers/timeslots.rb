get '/timeslots' do
  erb :'timeslots/index'
end

get '/timeslots/new' do
  @topics = Topic.all
  erb :'timeslots/new'
end

post '/timeslots/new' do
	puts "/n/n/n/n/n"
	params[:tutor_id] = session[:user_id]
	p params
  @timeslot = Timeslot.create(params)
  redirect back
end

get '/timeslots/:id/add_student' do
  @topics = Topic.all
  @users = User.all
  @timeslot_id = params[:id]
  @time = params[:time]
  erb :'timeslots/add_student'
end


get '/timeslots/be_student' do
  @topics = Topic.all
  @users = User.all
   @time = params[:time]
  @timeslots = Timeslot.where(time: @time)
  erb :'timeslots/be_student'
end

put '/timeslots/be_student' do
	puts "\n\n\n\n"
	p params
	@timeslot = Timeslot.update(params[:id], :topic_id => params[:topic_id], :student_id => current_user.id)
	redirect "/users/#{current_user.id}"
end
put '/timeslots/:id' do
	puts "\n\n\n\n"
	p params
	@timeslot = Timeslot.update(params[:id], :topic_id => params[:topic_id], :student_id => params[:student_id])
	redirect "/"
end

delete '/timeslots/:id' do
	@timeslot = Timeslot.delete(params[:id])
	redirect back
end


put '/timeslots/:id/remove_student' do
	@timeslot = Timeslot.update(params[:id], :topic_id => nil, :student_id => nil)
	redirect "/"
end