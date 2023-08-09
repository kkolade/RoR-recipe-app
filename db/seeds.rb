# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_example = User.new(name: 'User', email: 'user@example.com', password: '123456')
user_example.save!

recipe_one = Recipe.new(user: user_example, name: 'Apple pie', description: 'A pie made with apples', cooking_time: 30, preparation_time: 60, is_public: true)
recipe_two = Recipe.new(user: user_example, name: 'Cheese cake', description: 'A cake made with cheese', cooking_time: 30, preparation_time: 65, is_public: false)
recipe_one.save!
recipe_two.save!

testing_user = User.new(name: 'Test', email: 'test@example.com', password: '123456')
testing_user.save!

recipe_three = Recipe.new(user: testing_user, name: 'Apple pie', description: 'A pie made with apples')
recipe_three.save!

food_apple          = Food.new(name: 'Apple', measurement_unit: 'grams', price: 5)
food_pineapple      = Food.new(name: 'Pineapple', measurement_unit: 'grams', price: 10)
food_chicken_breast = Food.new(name: 'Chicken breast', measurement_unit: 'units', price: 20)
food_apple.save!
food_pineapple.save!
food_chicken_breast.save!
