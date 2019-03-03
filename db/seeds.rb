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
tests = Test.create([{ title: 'Optics', level: 3, category: categories[1] },
                     { title: 'Relativity theory', level: 3, category: categories[1] },
                     { title: 'Arithmetic operations', level: 0, category: categories[0] }])
question = Question.create(body: 'mass-energy equivalence formula', test: tests[1])
answers = Answer.create([{ body: 'E = m * c^2', correct: true, question: question },
                         { body: '2pi * r', correct: false, question: question }])
