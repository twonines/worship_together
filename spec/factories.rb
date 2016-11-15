FactoryGirl.define do
	factory :user do
		sequence(:name) { |i| "User #{i}" }
		sequence(:email) { |i| "User.#{i}@example.com" }
		password 'password'
		password_confirmation 'password'
		
		factory :admin do
		  admin true
		end
	end
end
