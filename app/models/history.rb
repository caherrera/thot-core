class History < ApplicationRecord
  belongs_to :comparation
  # validation
  validates_presence_of :seed, :comparator, :algorithm
end
