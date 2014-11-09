30.times do

  Widget.create name: Faker::Name.first_name,
                description: Faker::Lorem.words(6)
                age = (rand * 90).to_i
                # image: Faker::Internet.user_name
end
