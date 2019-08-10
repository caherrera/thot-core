# Principal application controller class
class ApplicationController < ActionController::API
  # include ComparationsService
  include StringComparatorService
  include Response
  include ExceptionHandler
  include ResponseErrors
end
