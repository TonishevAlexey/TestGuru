# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.new([
                       {name: :Eugene, last_name: :Awesome, email: 'exampleadmin@gmail.com', password: :password,type:"Admin"},
                       {name: :Kate, last_name: :Marley, email: 'exampleKate@gmail.com', password: :password},
                       {name: :Alex, last_name: :Hoy, email: 'exampleAlex@gmail.com', password: :password},
                       {name: :Bob, last_name: :Marley, email: 'exampleBob@gmail.com', password: :password}
                     ])
users.skip_confirmation!
users.save
categories = Category.create!([
                                {title: 'Ruby on Rails'},
                                {title: 'HTML'},
                                {title: 'CSS'}
                              ])

tests = Test.create!([
                       {body: "CSS body",title: "Ruby start", level: 1, category_id: categories[0].id, author_id: users[0].id },
                       {body: "CSS body",title: "RoR start", level: 2, category_id: categories[0].id, author_id: users[0].id },
                       {body: "CSS body",title: "HTML base", level: 1, category_id: categories[1].id, author_id: users[0].id },
                       {body: "CSS body",title: "CSS base", level: 1, category_id: categories[2].id, author_id: users[3].id }
                     ])

questions = Question.create!([
                               {title: 'Which typization does Ruby have?', test_id: tests[0].id },
                               {title: 'Which class helped us to create models?', test_id: tests[1].id },
                               {title: 'Which hyperlink form is correct?', test_id: tests[2].id },
                               {title: 'Wherewith content can be programmed in a markup language?', test_id: tests[3].id }
                             ])

answers = Answer.create!([
                           {body: 'Dynamic' , correct: true, question_id: questions[0].id },
                           {body: 'Strict', correct: false, question_id: questions[0].id },
                           {body: 'ActiveRecord' , correct: true, question_id: questions[1].id },
                           {body: 'CommandRecorder' , correct: false, question_id: questions[1].id },
                           {body: "<a href='some_link'...", correct: true, question_id: questions[2].id },
                           {body: "<a http='some_link'...", correct: false, question_id: questions[2].id },
                           {body: 'Tags' , correct: true, question_id: questions[3].id },
                           {body: 'Functions' , correct: false, question_id: questions[3].id }
                         ])

users_passed_tests = TestPassage.create!([
                                               { user_id: users[0].id, test_id: tests[0].id },
                                               { user_id: users[1].id, test_id: tests[2].id },
                                               { user_id: users[1].id, test_id: tests[2].id }
                                             ])