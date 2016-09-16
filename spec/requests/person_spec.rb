require 'rails_helper'

RSpec.describe 'person' do
  before do
    FactoryGirl.create_list(:person, 10)
  end

  it '#index' do
    get '/people'
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json.size).to be(10)
  end

  it '#show' do
    person = Person.last
    get "/people/#{person.id}"
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['first_name']).to eq(person.first_name)
    expect(json['last_name']).to eq(person.last_name)
  end

  it '#create' do
    post '/people',
      params: { person: {first_name: 'joe', last_name: 'wut' }},
      headers: { content_type: 'application/json' }
    json = JSON.parse(response.body)
    expect(response).to be_success
  end

  it '#update' do
    person = Person.last
    put "/people/#{person.id}",
      params: { person: {first_name: 'joe', last_name: 'wut' }},
      headers: { content_type: 'application/json' }
    json = JSON.parse(response.body)
    expect(response).to be_success
  end

  it '#destroy' do
    person = Person.last
    delete "/people/#{person.id}",
      params: { person: {first_name: 'joe', last_name: 'wut' }},
      headers: { content_type: 'application/json' }
    expect(Person.count).to be(9)
  end

end
