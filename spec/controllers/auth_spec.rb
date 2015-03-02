# run be rake db:test:prepare in console
require_relative '../spec_helper'

describe "Auth spec" do
  let(:user){User.create(name:"Daniel", password:"123", phase: "2")}

  it 'should have an index page' do
    get '/'
    expect(last_response.status).to be(200)
  end

  it 'should have a signin' do
    get '/signin'
    expect(last_response.body).to include("signin")
  end

  it 'should have a signup page' do
    get '/signup'
    expect(last_response.body).to include("Create Account")
    expect(last_response.status).to be(200)
  end

  it 'should redirect user after signing up' do
    post '/signup'
    expect(last_response).to be_redirect
    follow_redirect!
  end

end
