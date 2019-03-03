# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{ name: 'Bob' }, { name: 'Bill' }, { name: 'Mary' }])
categories = Category.create([{ title: 'Math' },
                              { title: 'Physics' },
                              { title: 'History' }])
tests = Test.create([{ title: 'Optics', level: 3, category_id: 2 },
                     { title: 'Relativity theory', level: 3, category_id: 2 },
                     { title: 'Arithmetic operations', level: 0, category_id: 1 }])
question = Question.create(body: 'mass-energy equivalence formula', test_id: 2)
answers = Answer.create([{ body: 'E = m * c^2', correct: true, question_id: 1 },
                         { body: '2pi * r', correct: false, question_id: 1 }])
