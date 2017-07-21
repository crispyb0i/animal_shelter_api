require 'rails_helper'
describe 'deletes one animal', :type=>:request do
  before {
    @animal = FactoryGirl.create(:animal)
    delete '/animals/'+@animal.id.to_s
  }

  it 'returns delete confirmation' do
    expect(JSON.parse(response.body)['message']).to eq("Your animal has been deleted successfully")
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
