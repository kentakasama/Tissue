FactoryBot.define do
  factory :user do
    email                 {"kasaken1113@gmail.com"}
    zip_code              {"146-0082"}
    home_address          {"東京都大田区池上4−14−8"}
    admin                 {false}
    password              {"password"}
    password_confirmation {"password"}
  end

  factory :admin do
    email                 {"kasaken1113@gmail.com"}
    zip_code              {"146-0082"}
    home_address          {"東京都大田区池上4−14−8"}
    admin                 {true}
    password              {"password"}
    password_confirmation {"password"}
  end
end
