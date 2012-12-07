FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
  	sequence(:email) { |n| "person_#{n}@example.com"}
  	password "foobar"
  	password_confirmation "foobar"
  end

  factory :conversation do
    content "Lorem ipsum"
    user
  end

  factory :reply do
  	content "Lorem ipsum"
  	user
  end

  factory :comment do
  	content "Lorem ipsum"
  	user
  end
end