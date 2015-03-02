get '/timeslots' do
  @tutor_ids = Timeslot.all.map {|x| x.tutor.id}.uniq
  @tutors = @tutor_ids.map {|id| User.find(id)}

  erb :'timeslots/index'
end

get '/timeslots/new' do
  @topics = Topic.all
  erb :'timeslots/new'
end

post '/timeslots/new' do
  @timeslot = Timeslot.create(params)
end

