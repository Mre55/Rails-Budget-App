require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Mihreteab Misganaw', email: 'example@mail.com', password: 'password') }
  let(:category) { user.categories.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png') }
  describe 'GET /index' do
    before do
      sign_in user
      get categories_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_category_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'should include correct placeholder' do
      expect(response.body).to include('Name')
    end
  end
end