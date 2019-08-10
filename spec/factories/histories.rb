# spec/factories/comparations.rb
FactoryBot.define do
  factory :history do
    seed { Faker::Lorem.word }
    comparator { Faker::Lorem.word }
    algorithm { Faker::Lorem.word }
    comparation { Comparation.first }
  end
end