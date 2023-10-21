FactoryBot.define do
  factory :system_requirement do
    sequence(:name) { |n| "Basic #{n}" }
    operational_system { Faker::Computer.os }
    storage { '500gb' }
    processor { 'Intel i5' }
    memory { '4gb' }
    video_board { 'Nvidia 1660S' }
  end
end
