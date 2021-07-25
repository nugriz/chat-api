FactoryBot.define do
    factory :conversation do
      friend { Faker::Lorem.word }
      user
      #friend { Faker::Color.color_name }
    end
  end