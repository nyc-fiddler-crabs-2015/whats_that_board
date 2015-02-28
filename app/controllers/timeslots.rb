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
end

