# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

testing_user = User.new(id: 999, name: 'Jose', email: 'test@example.com', password: '123456')
testing_user.save!

public_recipe_one = Recipe.new(id: 998 ,user_id: testing_user.id, name: 'Apple pie', description: 'A pie made with apples', cooking_time: 30, preparation_time: 60, public: true)
public_recipe_two = Recipe.new(id: 999 ,user_id: testing_user.id, name: 'Cheese cake', description: 'A cake made with cheese', cooking_time: 30, preparation_time: 65, public: true)
public_recipe_one.save!
public_recipe_two.save!
