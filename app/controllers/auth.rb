#replace all redirects to "/user/#{session[:user_id]}" to "/timeslots"
get '/' do
  if session[:user_id]
    redirect "/user/#{session[:user_id]}"
  else
    erb :"/auth/login"
  end
end

post '/signin' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user_id] =user.id
    redirect "/users
    /#{user.id}"
  else
    session[:message] = "Invalid username and/or password"
    redirect '/'
  end
end

get '/signup' do
  erb :"/auth/signup"
end

post '/signup' do
  user = User.create(name: params[:name], password: params[:password])
  session[:user_id] = user.id
  redirect "user/#{user.id}"
end

post '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/users/:user_id' do


  @queries = ["Open Timeslots (Mine)", "Open Timeslots (Others)", "Booked Timeslots (me teacher)", "Booked Timeslots (me student)", "All DBC Times for Requests", "All DBC Times for Requests"]
  @user = User.find(params[:user_id])
  erb :"/auth/userpage"
end

