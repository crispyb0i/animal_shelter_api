require 'rails_helper'
describe 'update animal', :type=>:request do

  before {
    @animal = FactoryGirl.create(:animal)
    put '/animals/'+@animal.id.to_s+'?name=Whiskers'
  }

  it 'returns the animal name' do
    expect(JSON.parse(response.body)['message']).to eq('Your animal has been updated successfully')
  end

  it 'returns accepted status' do
    expect(response).to have_http_status(:success)
  end
end
