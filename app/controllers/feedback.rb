get '/:id/feedback' do
  @tutor = User.find(params[:id])
  @feedback = @tutor.feedback
  erb "/feedback/index"
end

get '/:id/feedback/new' do
  @tutor = User.find(params[:id])
  erb "/feedback/new"
end

post '/:id/feedback/new' do
  @tutor = User.find(params[:id])
  Feedback.create(content: params[:content], user: @tutor)
  erb "/#{@tutor.id}/feedback"
end