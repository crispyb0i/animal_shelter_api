require 'rails_helper'
describe 'add animal', :type=>:request do

  before {
    post '/animals', params: {
      name: 'Dug',
      species: 'dog',

    }
  }

  it 'returns the animal name' do
    expect(JSON.parse(response.body)['name']).to eq('Dug')
  end

  it 'returns the animal species' do
    expect(JSON.parse(response.body)['species']).to eq('dog')
  end

  it 'returns created status' do
    expect(response).to have_http_status(:success)
  end
end
