FactoryGirl.define do
	factory :user do
		sequence(:name) { |i| "User #{i}" }
		sequence(:email) { |i| "User.#{i}@example.com" }
		password 'password'
	end
end
