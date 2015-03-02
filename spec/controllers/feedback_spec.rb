require_relative '../spec_helper'

class FeedbackSpec
  describe 'feedback' do
    let(:feedback) { Feedback.create(content: "I've got a lovely bunch of coconuts", user_id: 1)}

    before do
      feedback
    end

    it 'should respond to /:id/feedback' do
      get "/#{feedback.user_id}/feedback"
      expect(last_response).to be_ok
      expect(last_response.body).to include 'coconuts'
    end

    it 'should respond to /:id/feedback/new' do
      get "/#{feedback.user_id}/feedback/new"
      expect(last_response).to be_ok
      expect(last_response.body).to include 'submit'
    end

    it 'should respond to /:id/feedback/new' do
      post "/#{feedback.user_id}/feedback/new", params={ feedback: {content: "hey shawty", user_id: 1}}
      expect(last_response).to be_redirect
      follow_redirect!
      expect( last_response.body).to include 'submit'
      expect( last_response.body).to include 'shawty'
    end
  end
end