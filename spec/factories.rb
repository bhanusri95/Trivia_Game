FactoryGirl.define do
  factory :user do
    FirstName "Bhanu sri"
    LastName  "Karumanchi"
    email    "bhanusrikarumanchi@example.com"
    password "Bhanu1995*"
    password_confirmation "Bhanu1995*"
  end

  factory :trivium do
    question "What is your name"
    answer "Bhanu"
    tag_list "GK"
    user
  end

end