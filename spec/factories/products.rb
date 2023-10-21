# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Basic #{n}" }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 100.0..400.0) }

    after :build do |product|
      product.productable = FactoryBot.create(:game)
    end
  end
end
