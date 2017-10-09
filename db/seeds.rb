# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
   plant = Plant.new(
    name: Faker::Ancient.primordial+" "+Faker::Ancient.titan+" "+Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    category: Faker::ElderScrolls.race,
    esposizione: ['sole', 'ombra', "mezz'ombra"].sample,
    fioritura: ["estate", "autunno", "inverno", "primavera"].sample,
    altezza: ["bassa", "media", "alta"].sample,
    terreno: ["umido", "secco"].sample,
    densità: ["solitaria", "alta", "media"].sample,
    vaso: ["10cm", "15cm", "20cm", "30cm"].sample,
    disponibile: ["true", "false"].sample,
    novità: ["true", "false"].sample
  )
  plant.save!
end
