# frozen_string_literal: true

# This module provide the method for the controllers action route.
module ComparationsService
  # This class for the comparator services
  class Comparations < Validable
    # This method initialize the class to get comparations
    def initialize(params)
      @from = params.key?(:from) ? params[:from] : 0
      @to = params[:to]
      @id = params[:id]
    end

    # This method get comparations from database
    def comparations
      from = @from.to_i
      limit = @to.to_i - from
      # Excecute the find of comparations
      # if to exist like a param only take a part of result
      resu = @to ? Comparation.offset(from).limit(limit) : Comparation.all
      # Return the comparation
      resu
    end

    # This method get one comparation of database
    def one_comparation
      comparation = Comparation.find(@id)
      comparation
    end

    # Get the array of comparation history of database
    def history
      from = @from.to_i
      limit = @to.to_i - from
      # Excecute the find of comparations
      histories = @to ? History.offset(from).limit(limit) : History.all
      histories
    end

    # Get one history of database
    def one_history
      history = History.find(@id)
      history
    end

    # This mehotd validate the params need to execute this operation
    def validate_params
      if !@to.nil? && !@to.is_numeric?
        add_error(code: 400, error: 'The parameter to, be must a number')
      elsif (@from.is_a? String) && !@from.is_numeric?
        add_error(code: 400, error: 'The parameter from, be must a number')
      end
    end

    # Validate if the id param in the request params
    def validate_id
      return unless @id.nil?
      add_error(
        code: 400,
        error: 'The parameter to, be must a number')
    end
  end
end
