get '/:id/feedback' do
  @tutor = User.find(params[:id])
  @feedback = @tutor.feedbacks
  erb :"/feedback/index"
end

get '/:id/feedback/new' do
  @tutor = User.find(params[:id])
  erb :"/feedback/new"
end

post '/:id/feedback/new' do
  @tutor = User.find(params[:id])
  Feedback.create(content: params[:content], user: @tutor)
  redirect "/#{@tutor.id}/feedback"
end