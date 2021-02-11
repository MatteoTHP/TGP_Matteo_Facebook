
require'faker'

Author.destroy_all
Gossip.destroy_all
City.destroy_all

#crée la base de données
5.times do
    City.create(name: Faker::Nation.capital_city,
        zip_code: Faker::Address.zip_code,
        
    )
end

5.times do
    Author.create(first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        age: Faker::Number.number(digits: 2),
        description: Faker::Lorem.sentences(number: 1),
        city_id: City.all.sample.id,
    )
end


5.times do
    Gossip.create( title:Faker::House.furniture,
        content:Faker::ChuckNorris.fact,
        date: Faker::Time.forward,
        author_id: Author.all.sample.id,
    
    )
end