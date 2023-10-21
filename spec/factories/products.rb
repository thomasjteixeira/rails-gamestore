# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "MyString #{n}" }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 100.0..400.0) }
    productable { nil }
  end
end
