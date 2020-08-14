# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'destroy ingredients'
Dose.destroy_all
Ingredient.destroy_all

puts 'destroy cocktails'
Cocktail.destroy_all

puts 'create ingredients'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients = JSON.parse(open(url).read)
ingredients['drinks'].each do |ingredient|
  i = Ingredient.create(name: ingredient['strIngredient1'])
  puts "create #{i.name}"
end

mojojojo = Cocktail.create!(
  name: 'mojojojo',
  image_url: 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?ixlib=rb-1.2.1&auto=format&fit=crop&w=2734&q=80'
)
