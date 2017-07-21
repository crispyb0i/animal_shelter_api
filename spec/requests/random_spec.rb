
require 'rails_helper'
describe 'return a random animal', :type=>:request do

  before {
    @animal = FactoryGirl.create(:animal)
    get '/animals?random_animal='
  }

  it 'returns 200 status' do
    expect(response).to have_http_status(:success)
  end
end
