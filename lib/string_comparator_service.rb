# frozen_string_literal: true

require 'extensions.rb'
require 'siwa_api_client'
# This module provide the method for the controllers action route.
module StringComparatorService
  # This class for the comparator services
  class Comparator < Validable
    # This constructor set the initial values need to handle a comparation
    def initialize(params)
      # Validate params
      validate_params(params)
      # Asign the params
      @seed = params[:seed]
      @comparator = params[:comparator]
      @criteria = params[:criteria]
      @force = params[:force]
    end

    # Execute a comparation in thot
    def compare
      # If the parameters invalid is error
      return unless valid?
      # If the request forced
      return force_compare if @force
      cached_compare
    end

    # This method handle a call to siwa comparation api
    def siwa_compare
      api_call = SiwaApiClient.new
      api_call.compare @seed, @comparator
      return api_call.errors unless api_call.valid?

      api_call.compare_response
    end

    # Define the method that made a comparation in cache mode
    # (Only make a Siwa Request call if the comparations has not)
    def cached_compare
      # Find if have a saved comparation
      comparations = Comparation.where(
        '(seed=? AND comparator=?) OR (seed=? AND comparator=?)',
        @seed, @comparator,
        @comparator, @seed
      )
      # Verify if are a comparation
      @cached_comparation = comparations.last unless comparations.empty?

      # Call the siwa api to get the results and save if not are
      # comparatiosn saved
      @comparation = @cached_comparation || siwa_compare
    end

    # Define the method that made a comparation in force mode (Ever make a API
    # request to siwa)
    def force_compare
      # Call the siwa api to get the results and save
      @comparation = siwa_compare
    end

    # This method save the comparation history in database for
    # future extraction
    def save_comparation
      # Create a register with comparation
      History.create(
        seed: @seed,
        comparator: @comparator,
        algorithm: @criteria || 'all',
        comparation: @comparation
      )
    end

    # This method generate a response based on criteria and comparation
    def generate_response
      # Save the history
      save_comparation
      # Make the response
      response = filter
      # return the response
      return { resp: response, code: :ok } unless @cached_comparation
      # Return the response
      { resp: response, code: :non_authoritative_information }
    end

    # Define if the criteria used is an ilegal operarion
    # All ilegal operations must be a 501 code
    def ilegal_operation?(criteria)
      # If null return true
      return true if criteria.nil?
      # Search in criteria
      criterias_array = Criteria.new.criterias_array
      return false unless criterias_array.index(criteria).nil?
      # Handle error because this action its not implemented
      add_error(
        code: 501,
        error: "The criteria #{criteria} its not implemented"
      )
      true
    end

    # This method filter by criteria an Object with all similarity record and
    # transform in only the criteria selected
    def filter
      if !@criteria.nil? && @criteria
        result = @comparation.serializable_hash
        return filter_result result
      end
      @comparation.serializable_hash(except: [:created_at, :updated_at])
    end

    # Generate an object with the filter of results
    def filter_result(result)
      filter = {
        id: result['id'],
        seed: result['seed'],
        comparator: result['comparator']
      }
      filter[@criteria] = result[@criteria]
      # Return the hash filtered
      filter
    end

    # This mehotd validate the params need to execute this operation
    def validate_params(params)
      # Validate the criteria
      ilegal_operation? params[:criteria]
      # Validate if comparator is defined
      return if params.key? :comparator
      add_error(
        code: 422,
        error: 'The string comparator its required'
      )
    end
  end

  # Class to get the criterias
  class Criteria < Validable
    # Define the cache class
    def cache
      @cache ||= MiniCache::Store.new
    end

    # Get the criterias of algorithms
    def criterias_array
      return cache.get('criterias') if cache.set?('criterias')
      call_siwa_criterias
    end

    # This mehotd call to Siwa api to get criterias
    def call_siwa_criterias
      api_call = SiwaApiClient.new
      api_call.criterias
      return add_error(api_call.errors) unless api_call.valid?
      # Set in cache and return the array
      criterias = api_call.criteria_response
      cache.set('criterias', criterias)
      criterias
    end
  end
end
