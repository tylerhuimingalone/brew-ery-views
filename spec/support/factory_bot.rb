require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :brewery do
    sequence(:name) { |n| "BeerPalace #{n}" }
    address { "123 Summer St." }
    city { "Boston" }
    state { "MA" }
    zip { "02145" }
    image { "http://cheekymonkeyboston.com/wp-content/uploads/2017/07/slide4.jpg" }
  end
end
