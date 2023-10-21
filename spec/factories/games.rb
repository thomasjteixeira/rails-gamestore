# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    mode { %i[pvp pve both].sample }
    release_date { '2023-10-21 11:48:44' }
    developer { Faker::Company.name }
    system_requirement
  end
end
