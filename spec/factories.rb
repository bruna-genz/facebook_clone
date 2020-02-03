FactoryBot.define do
  factory :room_message do
    room { nil }
    user { nil }
    message { "MyText" }
  end

  factory :room do
    name { "MyString" }
  end

  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    email { 'joao.doe@example.com' }
    password { '123456' }
    password_confirmation { '123456' }
    birthday { Time.now - 18.years }
    gender { 'male' }
  end

  factory :user2, class: User do
    first_name { 'Mary' }
    last_name { 'Doe' }
    email { 'maria.doe@example.com' }
    password { '123456' }
    password_confirmation { '123456' }
    birthday { Time.now - 18.years }
    gender { 'female' }
  end
end
