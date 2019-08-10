# spec/requests/comparations_spec.rb
require 'rails_helper'

RSpec.describe 'Comparation History Endpoint', type: :request do
  # initialize test data 
  let!(:comparations) { create_list(:comparation, 40) }
  let(:comparations_id) { comparations.first.id }
  # Initialize the history data
  let!(:histories) { create_list(:history, 40) }
  let(:histories_id) { histories.first.id }

  # Test suite for GET /comparations
  describe 'GET /api/comparations' do
    # make HTTP get request before each example
    before { get '/api/comparations' }

    it 'returns comparations' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(40)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /comparations when request a number of results - For this example 25
  describe 'GET /api/comparations?from=0&to=25' do
    # make HTTP get request before each example
    before { get '/api/comparations?from=0&to=25' }

    it 'returns comparations' do
      expect(json).not_to be_empty
      expect(json.size).to eq(25)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /comparations when the from and to atributte is string
  describe 'GET /api/comparations?from=perro&to=gato' do
    # make HTTP get request before each example
    before { get '/api/comparations?from=perro&to=gato' }

    it 'returns status code 400' do
      expect(response).to have_http_status(400)
    end
  end

  # Test suite for GET /comparations when request a number of results - For this example 25
  describe 'GET /api/comparations/:id' do
    # make HTTP get request before each example
    before { get "/api/comparations/#{comparations_id}" }

    it 'returns comparations' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(comparations_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /comparations when request a number of results - For this example 25
  describe 'GET /api/comparations/history' do
    # make HTTP get request before each example
    before { get '/api/comparations/history' }

    it 'returns comparations' do
      expect(json).not_to be_empty
      expect(json.size).to eq(40)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /comparations when request a number of results - For this example 25
  describe 'GET /api/comparations/history?from=0&to=25' do
    # make HTTP get request before each example
    before { get '/api/comparations/history?from=0&to=25' }

    it 'returns comparations' do
      expect(json).not_to be_empty
      expect(json.size).to eq(25)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /comparations/history when the from and to atributte is string
  describe 'GET /api/comparations/history?from=perro&to=gato' do
    # make HTTP get request before each example
    before { get '/api/comparations/history?from=perro&to=gato' }

    it 'returns status code 400' do
      expect(response).to have_http_status(400)
    end
  end

  # Test suite for GET /comparations when request a number of results - For this example 25
  describe 'GET /api/comparations/history/:id' do
    # make HTTP get request before each example
    before { get "/api/comparations/history/#{histories_id}" }

    it 'returns comparations' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(histories_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end