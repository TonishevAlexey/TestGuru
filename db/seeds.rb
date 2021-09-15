# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(name: "Alex")
User.create(name: "Oleg")

category = Category.create(title: "Ruby1")
test = Test.create(title: "Rails", category_id: category.id)

answer = Question.create(title: "Rails model")
Answer.create(body: "123", question_id: answer.id)
UserTest.create(user_id: user, test_id: test)