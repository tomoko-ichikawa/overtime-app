FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name 'sakura'
    last_name 'endo'
    email { generate :email }
    password "111111"
    password_confirmation "111111"
    phone "5555555555"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'erika'
    last_name 'ikuta'
    email { generate :email }
    password "111111"
    password_confirmation "111111"
    phone "5555555555"
  end

  factory :non_authorized_user, class: "User" do
    first_name 'miduki'
    last_name 'yamashita'
    email { generate :email }
    password "111111"
    password_confirmation "111111"
    phone "5555555555"
  end
end