require_relative '../spec_helper'

describe Topic do
  let (:topic) { Topic.create(category: "Phase 2 Week 1", title: "RESTful Routes") }

  it 'should be a topic'
    expect(topic).to_not be nil

  it 'should have a category'
    expect(topic.category).to be "Phase 2 Week 1"

  it 'should have a title'
    expect(topic.title).to be "RESTful Routes"
  end
end