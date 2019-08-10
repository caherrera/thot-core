# frozen_string_literal: true

require 'rest-client'
require 'cgi'

# Declare the class of comparations Restful actions
# This class have the methods needed to compare two strings
# using eight algorithm criterias
class StringsController < ApplicationController
  def index
    # Handle error because this action its not implemented
    not_implemented(
      status: 'error',
      error: 'The method its not implemented'
    )
  end

=begin
  @api {get} /api/strings/:seed/compare/:comparator?criteria=:criteria&force=:force
  Compare Strings.
  @apiDescription Compare two strings to obtain the similarity.
  @apiName comparateString
  @apiGroup Strings
  @apiVersion 1.0.0

  @apiParam {String} seed Provide the string you want compare.
  @apiParam {String} comparator Provide the string you want use like
    comparator.
  @apiParam {Boolean} force  (Optional) Indicate if the query if forced.
    If the query if forced, the query ever call to Siwa remote server for
    comparation. Not use cache.
  @apiParam {String} criteria  (Optional) The criteria used to make the
  comparation. The parameter can be:
  - lineal
  - ncslineal
  - levenshtein
  - wlevenshtein
  - damerau
  - winkler
  - ngram
  - cosine
  - jaccard

  @apiSuccess {String} id  Id of comparation saved.
  @apiSuccess {String} seed  The first string used in comparatiom.
  @apiSuccess {String} comparation  The second string used in camparation.
  @apiSuccess {String} algorithm  The second algorithm used like criteria.
  @apiSuccess {Integer} comparation_id The comparation register used by this
  analisis.
=end

  # This method is used to compare two strings to get the similarity percent
  def compare
    # Get the parameters of request
    comparator = StringComparatorService::Comparator.new(params)
    # Compare the strings
    comparator.compare
    return error_response(comparator.errors) unless comparator.valid?
    # If not an error compare
    response = comparator.generate_response
    json_response(response[:resp], response[:code])
  end

=begin
  @api {get} /api/strings/comparations/criterias
  Get the compare criterias.
  @apiDescription Get the criterias to compare Strings.
  @apiName comparateString
  @apiGroup Strings
  @apiVersion 1.0.0

  @apiSuccess {String[]} response  An array with string criterias availables.
=end

  # This method is used to get the criterias used in comparation operation
  def criterias
    # Get the parameters of request
    criteria = StringComparatorService::Criteria.new
    criterias = criteria.criterias_array
    return error_response(criteria.errors) unless criteria.valid?
    # If not an error compare
    json_response(criterias)
  end
end
