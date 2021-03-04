# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

CSV.foreach(Rails.root.join('lib/plants_seeds.csv'), headers: true) do |row|

  Plant.create({
                 id: row[0],
                 name: row[1],
                 photo: row[2],
                 description: row[3],
                 category: row[4],
                 esposizione: row[5],
                 fioritura: row[6],
                 altezza: row[7],
                 terreno: row[8],
                 densità: row[9],
                 vaso: row[10],
                 disponibile: row[11],
                 novità: row[12],
                 utile_per: row[13],
                 created_at: row[14],
                 updated_at: row[15],
                 price_cents: row[16],
                 price_currency: row[17],
                 nascondi: row[18]
  })
end
