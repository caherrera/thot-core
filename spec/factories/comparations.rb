# spec/factories/comparations.rb
FactoryBot.define do
  factory :comparation do
    seed { Faker::Lorem.word }
    comparator { Faker::Number.decimal(2, 3) }
    lineal { Faker::Number.decimal(2, 3) }
    ncslineal { Faker::Number.decimal(2, 3) }
    levenshtein { Faker::Number.decimal(2, 3) }
    wlevenshtein { Faker::Number.decimal(2, 3) }
    damerau { Faker::Number.decimal(2, 3) }
    ngram { Faker::Number.decimal(2, 3) }
    cosine { Faker::Number.decimal(2, 3) }
    winkler { Faker::Number.decimal(2, 3) }
    jaccard { Faker::Number.decimal(2, 3) }
  end
end