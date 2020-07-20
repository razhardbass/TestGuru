# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { name: 'Admin', password: '111' },
                       {  name: 'User1', password: '222'  },
                       {  name: 'User2', password: '333'  }
                     ])

categories = Category.create!([
                                { title: 'Sport' },
                                { title: 'Math' },
                                { title: 'Geography' }
                              ])

tests = Test.create!([
                       { title: 'Footbal', level: 1, category_id: categories.first.id, user_id: users[1].id },
                       { title: 'Tennis', level: 1,  category_id: categories.first.id, user_id: users[1].id },
                       { title: 'Algebra', level: 1, category_id: categories[1].id, user_id: users.last.id},
                       { title: 'Geometry', level: 0, category_id: categories[1].id, user_id: users.last.id },
                       { title: 'Capitals of countries', level: 0, category_id: categories.last.id, user_id: users.last.id }
                     ])

questions = Question.create!([
                               { body: 'Who won the 2014 world Cup?', test_id: tests.first.id },
                               { body: 'Will Carioca come to Russia?', test_id: tests.first.id },
                               { body: 'The most decorated tennis player?', test_id: tests[1].id },
                               { body: '3x+1=10, x = ?', test_id: tests[2].id },
                               { body: 'What is an isosceles triangle?', test_id: tests[3].id },
                               { body: 'What is the capital of France?', test_id: tests.last.id }
                             ])

answers = Answer.create!([
                           { body: 'Germany', correct: true, question_id: questions.first.id },
                           { body: 'No', correct: true, question_id: questions[1].id },
                           { body: 'Roger Federer', correct: true, question_id: questions[2].id },
                           { body: '3', correct: true, question_id: questions[3].id },
                           { body: 'Triangle with 2 equal sides', correct: true, question_id: questions[4].id },
                           { body: 'Paris', correct: true, question_id: questions.last.id }
                         ])


                                  
users.each do |user|
  tests.each do |test|
     user.tests.push(test)
     user.save
  end
end
