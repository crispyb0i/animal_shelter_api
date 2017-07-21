require 'rails_helper'
describe 'search for an animal based on name', :type=>:request do

  before {
    @animal = FactoryGirl.create(:animal)
  }

  it 'returns found animal data' do
    get '/animals?name='+@animal.name
    expect(JSON.parse(response.body)[0]['name']).to eq('Spunky')
  end

  it 'returns status code 200' do
    get '/animals?name='+@animal.name
    expect(response).to have_http_status(:success)
  end
end
