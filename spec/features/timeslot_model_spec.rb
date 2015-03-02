require_relative '../spec_helper'

describe Timeslot do
  let (:timeslot) { Timeslot.create(time: "10 AM", student_id: 1, tutor_id: 2, topic_id: 1) }

  it 'should be a timeslot'
    expect(timeslot).to_not be nil

  it 'should have a time'
    expect(timeslot.time).to be "!0 AM"
  end
end