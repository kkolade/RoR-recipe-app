# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_example = User.new(id: 999, name: 'User', email: 'user@example.com', password: '123456')
user_example.save!

recipe_one = Recipe.new(id: 998 ,user: user_example, name: 'Apple pie', description: 'A pie made with apples', cooking_time: 30, preparation_time: 60, is_public: true)
recipe_two = Recipe.new(id: 999 ,user: user_example, name: 'Cheese cake', description: 'A cake made with cheese', cooking_time: 30, preparation_time: 65, is_public: false)
recipe_one.save!
recipe_two.save!

testing_user = User.new(id: 1000, name: 'Test', email: 'test@example.com', password: '123456')
testing_user.save!

recipe_three = Recipe.new(id: 1000 ,user: testing_user, name: 'Apple pie', description: 'A pie made with apples')
recipe_three.save!