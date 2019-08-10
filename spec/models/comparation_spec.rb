require 'rails_helper'

RSpec.describe Comparation, type: :model do
  # Ensure the relation
  # it { should have_many(:history).dependent(:destroy) }
  # Ensure if the columns required are present
  it { should validate_presence_of(:seed) }
  it { should validate_presence_of(:comparator) }
  it { should validate_presence_of(:lineal) }
  it { should validate_presence_of(:ncslineal) }
  it { should validate_presence_of(:levenshtein) }
  it { should validate_presence_of(:wlevenshtein) }
  it { should validate_presence_of(:damerau) }
  it { should validate_presence_of(:ngram) }
  it { should validate_presence_of(:jaccard) }
  it { should validate_presence_of(:winkler) }
  it { should validate_presence_of(:cosine) }
end
