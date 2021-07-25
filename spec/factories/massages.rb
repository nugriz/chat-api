FactoryBot.define do
    factory :massage do
      sender { Faker::Number.number(10) }
      content { Faker::Lorem.word }
      read false
      conversation_id nil
    end
  end