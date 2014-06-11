include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :user do
    username "user"
    password "user1234"
    password_confirmation "user1234"
  end

  factory :category do
    name "Fun"
    description "Just for fun."
  end

  factory :item do
    name "Play football"
    description "Play football with friends."
    status Status.pending
  end
end