get '/timeslots' do
  erb :'timeslots/index'
end

get '/timeslots/new' do
  erb :
end

post '/timeslots/new' do
  @timeslot = Timeslot.create(params)
end

