require 'rails_helper'
describe 'show single animal data', :type=>:request do

  before {
    @animal = FactoryGirl.create(:animal)
    get '/animals/'+@animal.id.to_s
  }

  it 'returns pet data' do
    expect(JSON.parse(response.body)['name']).to eq(@animal.name)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
