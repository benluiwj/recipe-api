# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Seeding user'

User.create(user_name: 'test', email: 'test@gmail.com', password: '1234', name: 'test')

puts 'Seeding Recipe'

Recipe.create(
	image: 'https://raw.githubusercontent.com/do-community/react_rails_recipe/master/app/assets/images/Sammy_Meal.jpg',
	name: 'test recipe',
	source_url: 'https://www.allrecipes.com/recipe/270643/pumpkin-protein-muffins/',
	category: 'muffin',
	serving_size: 2,
	prep_time: 2,
	cook_time: 2,
	yield: 'some yield',
	notes: 'some notes',
	user_id: 1
)

Ingredient.create(
	name: 'ingredient 1',
	amount: 2,
	units: 'grams',
	recipe_id: 1,
)

Procedure.create(
	step_num: 1,
	procedure: 'this is the first procedure',
	recipe_id: 1
)