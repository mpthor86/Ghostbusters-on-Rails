# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ghostbuster.create([{name: 'Peter Venkman', years_experience: 36}, 
                    {name: 'Ray Stantz', years_experience: 36}, 
                    {name: 'Egon Spengler', years_experience: 36},
                    {name: 'Winston Zeddmore', years_experience: 36}])

User.create([{username: Faker::Name.name, password: 'password', address: Faker::Address.full_address},
            {username: Faker::Name.name, password: 'password', address: Faker::Address.full_address},
            {username: Faker::Name.name, password: 'password', address: Faker::Address.full_address}])