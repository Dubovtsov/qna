# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
questions = Question.create([{title: 'first question', body: 'Язык HTML - язык…'},
                             {title: 'second question', body: 'Ruby'},
                             {title: 'third question', body: 'Rails'},
                             {title: 'fourth question', body: 'JS'}])

Answer.create([{body: 'программирования', question_id: questions[0].id},
               {body: 'разметки страницы', question_id: questions[0].id},
               {body: 'общения', question_id: questions[0].id}])
