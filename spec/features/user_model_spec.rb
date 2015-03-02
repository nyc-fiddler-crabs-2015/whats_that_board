# run be rake db:test:prepare in console
require_relative '../spec_helper'

describe User do
  let (:user) { User.create(name: "Daniel", password: "1234", phase: 2) }

  it 'should be a user'
    expect(user).to_not be nil

  it 'should have a name'
    expect(user.name).to be "Daniel"

  it 'should have a phase'
    expect(user.phase).to be 2
  end
end