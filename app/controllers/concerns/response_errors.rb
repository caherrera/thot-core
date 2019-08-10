# This module have the common errors used by this api
module ResponseErrors
  # This method return a response error
  def error_response(object)
    render json: object[:error], status: object[:code]
  end
  # This method return a response whith 501 http code
  def not_implemented(object)
    render json: object, status: 501
  end

  # This method return a response whith 400 http code
  def bad_request(object)
    render json: object, status: 400
  end

  # This method return a response whith 422 http code
  def missing_parameters(object)
    render json: object, status: 422
  end

  # This method return a response whith 500 http code
  def internal_server_error(object)
    render json: object, status: 500
  end
end
