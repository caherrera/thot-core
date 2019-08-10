# This class provide the method to validate error to services
class Validable
  attr_accessor :errors

  # Constructor of class Validable
  def initialize
    @errors = nil
  end

  # This method ensure the Object is valid and can handle a response
  def valid?
    !@errors.present?
  end

  # Method to add error to error object
  def add_error(error)
    @errors = error
    @errors
  end
end
