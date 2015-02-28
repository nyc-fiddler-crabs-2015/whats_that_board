get '/timeslots' do
  erb :'timeslots/index'
end

get '/timeslots/new' do
  @topics = Topic.all
  erb :'timeslots/new'
end

post '/timeslots/new' do
	puts "/n/n/n/n/n"
	p params
  @timeslot = Timeslot.create(params)
end

