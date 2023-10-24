# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Basic #{n}" }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 100.0..400.0) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/product_image.jpg')) }

    after :build do |product|
      product.productable = FactoryBot.create(:game)
    end
  end
end
