class Comparation < ApplicationRecord
  # model association
  has_many :histories
  # validation
  validates_presence_of :seed, :comparator, :lineal, :ncslineal, :levenshtein, :wlevenshtein, :damerau, :winkler, :cosine, :ngram, :jaccard
end
