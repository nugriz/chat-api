FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      phone '085603336160'
      password 'foobar'
    end
  end