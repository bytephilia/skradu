# encoding: UTF-8
FactoryGirl.define do
  factory :user do
    name     "Jóhann Óskar Jóhannsson"
    email    "mumu@example.com"
    password "mohmoh"
    password_confirmation "mohmoh"
  end
end