FactoryBot.define do
  factory :item do
    name do
      "#{Faker::Emotion.adjective}-#{Faker::Color.color_name} #{Faker::Commerce.product_name}".upcase_first
    end
    category { Faker::Number.between(from: 0, to: 9) }
    description { Faker::Hipster.sentence }
    available { Faker::Number.between(from: 0, to: 1) }
    amount { Faker::Number.between(from: 1, to: 5) }
    status { Faker::Number.between(from: 0, to: 2) }
  end
end
