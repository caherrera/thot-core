# spec/requests/comparations_spec.rb
require 'rails_helper'

RSpec.describe 'Strings comparation Enpoint', type: :request do

  # Test suite for GET strings comparation resume
  describe 'GET /api/strings/test/compare/test' do
    # make HTTP get request before each example
    before 'Before analisis' do
      get '/api/strings/test/compare/test'
      @lastIndex = Comparation.last[:id]
    end

    it 'returns of compare' do
      expect(json).not_to be_empty
      # Make a expected response
      jsonFile = File.read(File.dirname(__FILE__) + '/json_responses/comparation_resume.json')
      expectedJson = JSON.parse(jsonFile);
      # Add the last index
      expectedJson["id"] = @lastIndex
      # Compare the result
      expect(json).to eq(expectedJson)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    
  end

  # Test suite for GET strings comparation resume in cache
  describe 'GET /api/strings/test/compare/test' do
    # make HTTP get request before each example
    before 'Before analisis' do
      get '/api/strings/test/compare/test'
      @lastIndex = Comparation.last[:id]
    end

    it 'returns comparations' do
      # check the response if not empty
      expect(json).not_to be_empty
      # Make a expected response
      jsonFile = File.read(File.dirname(__FILE__) + '/json_responses/comparation_resume.json')
      expectedJson = JSON.parse(jsonFile);
      # Add the last index
      expectedJson["id"] = @lastIndex
      # Compare the result
      expect(json).to eq(expectedJson)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    
    it 'returns of compare of cache response' do
      # Do the http request
      get '/api/strings/test/compare/test'
      expect(json).not_to be_empty
      # Make a expected response
      jsonFile = File.read(File.dirname(__FILE__) + '/json_responses/comparation_resume.json')
      expectedJson = JSON.parse(jsonFile);
      # Add the last index
      expectedJson["id"] = @lastIndex
      # Compare the result
      expect(json).to eq(expectedJson)
      # Calcule if the code is 203
      expect(response).to have_http_status(203)
    end
  end

  # Test suite for GET strings comparation with criteria
  describe 'GET /api/strings/test/compare/test?criteria=lineal' do
    # make HTTP get request before each example
    before 'Before analisis' do
      get '/api/strings/test/compare/test?criteria=lineal'
      @lastIndex = Comparation.last[:id]
    end

    it 'returns comparations' do
      # check the response if not empty
      expect(json).not_to be_empty
      # Make a expected response
      jsonFile = File.read(File.dirname(__FILE__) + '/json_responses/comparation_criteria.json')
      expectedJson = JSON.parse(jsonFile);
      # Add the last index
      expectedJson["id"] = @lastIndex
      # Compare the result
      expect(json).to eq(expectedJson)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET strings comparation with criteria in cache
  describe 'GET /api/strings/test/compare/test?criteria=lineal' do
    # make HTTP get request before each example
    before 'Before analisis' do
      get '/api/strings/test/compare/test?criteria=lineal'
      @lastIndex = Comparation.last[:id]
    end

    it 'returns comparations' do
      # check the response if not empty
      expect(json).not_to be_empty
      # Make a expected response
      jsonFile = File.read(File.dirname(__FILE__) + '/json_responses/comparation_criteria.json')
      expectedJson = JSON.parse(jsonFile);
      # Add the last index
      expectedJson["id"] = @lastIndex
      # Compare the result
      expect(json).to eq(expectedJson)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns of compare of cache response' do
      # Do the http request
      get '/api/strings/test/compare/test?criteria=lineal'
      expect(json).not_to be_empty
      # Make a expected response
      jsonFile = File.read(File.dirname(__FILE__) + '/json_responses/comparation_criteria.json')
      expectedJson = JSON.parse(jsonFile);
      # Add the last index
      expectedJson["id"] = @lastIndex
      # Compare the result
      expect(json).to eq(expectedJson)
      # Calcule if the code is 203
      expect(response).to have_http_status(203)
    end
  end

  # Test suite for GET strings comparation resume when user force the comparation
  describe 'GET /api/strings/test/compare/test?force=true' do
    # make HTTP get request before each example
    before 'Before analisis' do
      get '/api/strings/test/compare/test?force=true'
      @lastIndex = Comparation.last[:id]
    end

    it 'returns comparations' do
      # check the response if not empty
      expect(json).not_to be_empty
      # Make a expected response
      jsonFile = File.read(File.dirname(__FILE__) + '/json_responses/comparation_resume.json')
      expectedJson = JSON.parse(jsonFile);
      # Add the last index
      expectedJson["id"] = @lastIndex
      # Compare the result
      expect(json).to eq(expectedJson)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET strings comparation with criteria when user force the comparation
  describe 'GET /api/strings/test/compare/test?criteria=lineal&force=true' do
    # make HTTP get request before each example
    before 'Before analisis' do
      get '/api/strings/test/compare/test?criteria=lineal&force=true'
      @lastIndex = Comparation.last[:id]
    end

    it 'returns comparations' do
      # check the response if not empty
      expect(json).not_to be_empty
      # Make a expected response
      jsonFile = File.read(File.dirname(__FILE__) + '/json_responses/comparation_criteria.json')
      expectedJson = JSON.parse(jsonFile);
      # Add the last index
      expectedJson["id"] = @lastIndex
      # Compare the result
      expect(json).to eq(expectedJson)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET strings comparation without the comparator
  describe 'GET /api/strings/test/compare' do
    # make HTTP get request before each example
    before { get '/api/strings/test/compare' }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end
  end

  # Test suite for GET strings without the operation
  describe 'GET /api/strings/test' do
    # make HTTP get request before each example
    before { get '/api/strings/test' }

    it 'returns status code 400' do
      expect(response).to have_http_status(501)
    end
  end

  # Test suite for GET strings
  describe 'GET /api/strings' do
    # make HTTP get request before each example
    before { get '/api/strings' }

    it 'returns status code 501' do
      expect(response).to have_http_status(501)
    end
  end

  # Test suite for GET strings comparation without the comparator
  describe 'GET /api/strings/test/compare/test?criteria=invert' do
    # make HTTP get request before each example
    before { get '/api/strings/test/compare/test?criteria=invert' }

    it 'returns status code 501' do
      expect(response).to have_http_status(501)
    end
  end
end