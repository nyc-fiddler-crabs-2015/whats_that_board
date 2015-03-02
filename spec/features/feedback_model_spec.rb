require_relative '../spec_helper'

describe Feedback do
  let (:feedback) { Feedback.create(content: "Shawty want a thug", user_id: 1) }

  it 'should be a piece of feedback' do
    expect(feedback).to_not be nil
  end 

  it 'should have content' do
    expect(feedback.content).to include "Shawty want a thug"
  end
end
