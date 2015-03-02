get '/users/:id/feedback' do
  @tutor = User.find(params[:id])
  @feedback = Feedback.where(user_id: params[:id])
  erb :'feedback/index'
end

get '/users/:id/feedback/new' do
  @tutor = User.find(params[:id])
  erb :'feedback/new'
end

post '/users/:id/feedback/new' do
  @tutor = User.find(params[:id])
  Feedback.create(content: params[:content], user_id: @tutor.id)
  redirect "/users/#{@tutor.id}/feedback"
end