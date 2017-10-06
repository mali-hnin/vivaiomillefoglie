# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  pianta = Pianta.create(
    name: Faker::Ancient.primordial+" "+Faker::Ancient.titan+" "+Faker::Lorem.word,
    photo: "https://source.unsplash.com/collection/256466",
    description: Faker::Lorem.paragraph,
    category: Faker::ElderScrolls.race,
    esposizione: ['sole', 'ombra', "mezz'ombra"].sample,
    fioritura: ["estate", "autunno", "inverno", "primavera"].sample,
    altezza: ["bassa", "madia", "alta"].sample,
    terreno: ["umido", "secco"].sample,
    densità: ["solitaria", "alta", "media"].sample,
    vaso: ["10cm", "15cm", "20cm", "30cm"].sample,
    disponibilità: ["true", "false"].sample,
    novità: ["true", "false"].sample
  )
end
