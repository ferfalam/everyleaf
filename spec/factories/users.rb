FactoryBot.define do
  factory :user do
    email { "no.admin@gmail.com" }
    password { "password" }
    admin {false}
  end

  factory :user_admin, class: User do
    email { "admin@gmail.com" }
    password { "password" }
    admin {true}
  end
end
