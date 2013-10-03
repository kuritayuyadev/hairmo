namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = Cosmetician.create!(name: "nozawa",
								   email: "nozawa.dev@gmail.com",
								   password: "nozawa")
		admin.toggle!(:admin)
		Cosmetician.create!(name: "Exmample Cosmetician",
							email: "example@sample.jp",
						    password: "foobar",
						    salon_name: "examplesalon",
							salon_address: "exampleaddress")
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@sample.jp"
			password = "password"
			salon_name = "example-#{n+1}salon"
			salon_address = "example-#{n+1}address"
			Cosmetician.create!(name: name,
							   email: email,
							   password: password,
							   salon_name: salon_name,
							   salon_address: salon_address)
		end
	end
end
