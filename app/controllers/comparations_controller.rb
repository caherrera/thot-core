# frozen_string_literal: true

# Declare the class of comparations Restful actions
# This class have the methods to get a comparation history
class ComparationsController < ApplicationController
=begin
  @api {get} /api/comparations?from=:from&to=:to Get all comparations.
  @apiDescription Get all comparations saved in database.
  @apiName getComparations
  @apiGroup Comparations
  @apiVersion 1.0.0

  @apiParam {Number} from Provide the initial position where the read is start.
  @apiParam {Number} to Provide the final position where the read is stop.

  @apiSuccess {Object[]} response The list of camparations saved in the system.
  @apiSuccess {String} response.id  Id of comparation saved.
  @apiSuccess {String} response.seed  The first string used in comparatiom.
  @apiSuccess {String} response.comparation  The second string used in
    camparation.
  @apiSuccess {Float} response.lineal  The result of analisis by lineal
    algorithm.
  @apiSuccess {Float} response.ncslineal  The result of analisis by No case
    sensitive lineal algorithm.
  @apiSuccess {Float} response.levenshtein  The result of analisis by
    Levenshtein distance.
  @apiSuccess {Float} response.wlevenshtein  The result of analisis by Weight
    Levenshtein distance.
  @apiSuccess {Float} response.damerau  The result of analisis by
    Damerau-Levenshtein distance.
  @apiSuccess {Float} response.winkler  The result of analisis by
    Winkler Divergence.
  @apiSuccess {Float} response.ngram  The result of analisis by
    lineal N-Gram Algorithm.
  @apiSuccess {Float} response.cosine  The result of analisis by
    N-Gram based Cosine Algorithm.
  @apiSuccess {Float} response.jaccard  The result of analisis by
    N-Gram based Jaccard Algorithm.
=end

  # Define the method that get all comparations
  def index
    # Create an instance of comparat
    comparations = ComparationsService::Comparations.new(params)
    comparations.validate_params
    # return the results if not are an error
    return error_response(comparations.errors) unless comparations.valid?
    json_response(comparations.comparations)
  end

=begin
  @api {get} /api/comparations/:id Get one comparation saved.
  @apiDescription Get one comparation saved with index id.
  @apiName getOneComparation
  @apiGroup Comparations
  @apiVersion 1.0.0

  @apiParam {Number} id Comparation unique id.

  @apiSuccess {String} id  Id of comparation saved.
  @apiSuccess {String} seed  The first string used in comparatiom.
  @apiSuccess {String} comparation  The second string used in camparation.
  @apiSuccess {Float} lineal  The result of analisis by lineal algorithm.
  @apiSuccess {Float} ncslineal  The result of analisis by No case sensitive
    lineal algorithm.
  @apiSuccess {Float} levenshtein  The result of analisis by Levenshtein
    distance.
  @apiSuccess {Float} wlevenshtein  The result of analisis by Weight
    Levenshtein distance.
  @apiSuccess {Float} damerau  The result of analisis by Damerau-Levenshtein
    distance.
  @apiSuccess {Float} winkler  The result of analisis by Winkler Divergence.
  @apiSuccess {Float} ngram  The result of analisis by lineal N-Gram Algorithm.
  @apiSuccess {Float} cosine  The result of analisis by N-Gram based Cosine
    Algorithm.
  @apiSuccess {Float} jaccard  The result of analisis by N-Gram based Jaccard
    Algorithm.
=end

  # Define the method that get one comparations
  def one_comparation
    # Create an instance of comparat
    comparations = ComparationsService::Comparations.new(params)
    comparations.validate_id
    # return the results if not are an error
    return error_response(comparations.errors) unless comparations.valid?
    json_response(comparations.one_comparation)
  end

=begin
  @api {get} /api/comparations/history?from=:from&to=:to Get history of
    comparations.
  @apiDescription Get the global history of comparations.
  @apiName getComparationsHistory
  @apiGroup Comparations
  @apiVersion 1.0.0

  @apiParam {Number} from Provide the initial position where the read is start.
  @apiParam {Number} to Provide the final position where the read is stop.

  @apiSuccess {Object[]}  response An array with the users comparation history
  @apiSuccess {String} response.id  Id of comparation saved.
  @apiSuccess {String} response.seed  The first string used in comparatiom.
  @apiSuccess {String} response.comparation  The second string used in
    camparation.
  @apiSuccess {String} response.algorithm  The second algorithm used like
    criteria.
  @apiSuccess {Integer} response.comparation_id The comparation register used
    by this analisis.
=end

  # Define the method that get the comparations history
  def history
    # Create an instance of comparat
    histories = ComparationsService::Comparations.new(params)
    histories.validate_params
    # return the results if not are an error
    return error_response(histories.errors) unless histories.valid?
    json_response(histories.history)
  end

=begin
  @api {get} /api/comparations/history/:id Get one history of comparations.
  @apiDescription Get one history of comparations by his id.
  @apiName getOneComparationsHistory
  @apiGroup Comparations
  @apiVersion 1.0.0

  @apiParam {Number} id Comparation history unique id.

  @apiSuccess {String} id  Id of comparation saved.
  @apiSuccess {String} seed  The first string used in comparatiom.
  @apiSuccess {String} comparation  The second string used in camparation.
  @apiSuccess {String} algorithm  The second algorithm used like criteria.
  @apiSuccess {Integer} comparation_id The comparation register used
  by this analisis.
=end

  # Define the method that get one comparations history
  def one_history
    # Create an instance of comparat
    history = ComparationsService::Comparations.new(params)
    history.validate_id
    # return the results if not are an error
    return error_response(history.errors) unless history.valid?
    json_response(history.one_history)
  end
end
