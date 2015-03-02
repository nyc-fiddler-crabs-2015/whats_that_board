require_relative '../spec_helper'

class TimeslotSpec
  describe 'timeslots' do
    let(:timeslot) { Timeslot.create(time: "10 AM", student_id: 1, tutor_id: 1,  topic_id: 1)}

    before do
      timeslot
    end

    it 'should respond to /timeslots' do
      get '/timeslots'
      expect(last_response).to be_ok
      expect(last_response.body).to include '10 AM'
    end

    it 'should respond to /timeslots/new' do
      get '/timeslots/new'
      expect(last_response).to be_ok
      expect(last_response.body).to include 'add'
    end

    it 'should respond to /timeslots/:id/add_student' do
      get "/timeslots/#{timeslot.id}/add_student"
      expect(last_response).to be_ok
    end
  end
end