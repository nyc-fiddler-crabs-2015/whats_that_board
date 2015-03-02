require_relative '../spec_helper'

describe Feedback do
  let (:feedback) { Feedback.create(content: "Shawty want a thug", user_id: 1) }

  it 'should be a piece of feedback'
    expect(feedback).to_not be nil

  it 'should have content'
    expect(feedback.content).to include "Shawty want a thug"
  end
end