# This class make a call to siwa api.
# For this the call to api ever is make for all criterias to saved all data
# posible. If in the future the users search by the same words but with others
# criterias the result already on database.
# Too can make and api call to get the comparation criterias
class SiwaApiClient < Validable
  # The constructor of class Siwa Api client
  # Initialize the vars for not asumption
  def initialize
    @comparator = nil
    @path = nil
    @response = nil
    @seed = nil
  end
  
  # This method is used to compare two strings in siwa api
  def compare(seed, comparator)
    # Escape the word to compare
    @seed = CGI.escape(seed)
    @comparator = CGI.escape(comparator)

    # Call the path constructor
    compare_string_path
  end

  # This method is used to get the compare criterias from siwa api
  def criterias
    # Call the path constructor
    criterias_string_path
  end

  def compare_string_path
    # Generate the path of Siwa api call
    @path = "#{ENV['SIWA_HOST']}:#{ENV['SIWA_PORT']}/api/strings/"\
    "#{@seed}/operations?operation=compare&with=#{@comparator}"

    # Call siwa api
    call_api
  end

  def criterias_string_path
    # Generate the path of Siwa api call
    @path = "#{ENV['SIWA_HOST']}:#{ENV['SIWA_PORT']}/api/strings/"\
    'operations/compare/criterias'

    # Call siwa api
    call_api
  end

  # This method have the responsability to call the siwa api
  def call_api
    # Make the get call
    @response = RestClient.get @path
    return if @response.code == 200
    add_error(
      code: 500,
      error: 'The request to Siwa API its not available'
    )
  end

  def compare_response
    # Parse the JSON response
    siwa_response = JSON.parse(@response.body)
    comparation_obj = {
      seed: @seed,
      comparator: @comparator
    }
    # Add th result of algorithm to new object
    siwa_response.each do |similarity|
      comparation_obj[similarity['criteria']] = similarity['similarity']
    end
    # Return the new created comparation
    Comparation.create(comparation_obj)
  end

  def criteria_response
    # Parse the JSON response
    siwa_response = JSON.parse(@response.body)
    # Return the new created comparation
    siwa_response
  end
end
