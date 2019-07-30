require 'rails_helper'

RSpec.describe 'POST /users/sign_in', type: :request do
  let(:user) { User.create(name: 'David', last_name: 'Cantu', email: 'testing@test.com', password: '123456', password_confirmation: '123456', username: 'testuser') }
  let(:url) { '/users/sign_in' }
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when params are correct' do
    before do
      post url, params: params
    end

    it 'returns 200' do
      puts user
      expect(response).to have_http_status(200)
    end

    it 'returns JTW token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid JWT token' do
      token_from_request = response.headers['Authorization'].split('').last
      decoded_token = JWT.decode(token_from_request, ENV['DEVISE_JWT_SECRET_KEY'], true)
      expect(decoded_token.first['sub']).to be_present
    end
  end

  context 'when sign in params are incorrect' do
    before { post url }
    
    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end
end

RSpec.describe 'DELETE /users/sign_out', type: :request do
  let(:url) { '/users/sign_out' }

  it 'returns 204, no content' do
    delete url
    expect(response).to have_http_status(204)
  end
end