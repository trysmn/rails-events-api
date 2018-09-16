FactoryBot.define do
  factory :event do
    start_time { Time.now.iso8601(3) }
    end_time { Time.now.iso8601(3) }
    label { Faker::App.name }
    category { Faker::Color.color_name }
  end
end
