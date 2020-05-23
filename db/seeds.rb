# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning key questions..."

key_questions = Question.where(key_question: true)
unless key_questions.first.nil?
  Question.destroy(key_questions)
end 

puts "Creating new Questions...."

question = Question.create(
  description: "Qual o seu sistema favorito?",
  key_question: true
)

answers = [Answer.create(
  question: question,
  description: "Dungeon & Dragons 5ª Edição"
),
Answer.create(
  question: question,
  description: "GURPS"
),
Answer.create(
  question: question,
  description: "Vampiro A Máscara"
),
Answer.create(
  question: question,
  description: "PathFinder"
),
Answer.create(
  question: question,
  description: "Outro"
)]

question = Question.create(
  description: "Qual sua temática favorita?",
  key_question: true
)

answers = [Answer.create(
  question: question,
  description: "Fantasia Medieval"
),
Answer.create(
  question: question,
  description: "Cyberpunk"
),
Answer.create(
  question: question,
  description: "Steampunk"
),
Answer.create(
  question: question,
  description: "Dark Fantasy"
),
Answer.create(
  question: question,
  description: "Outro"
)]

question = Question.create(
  description: "Quanto tempo você tem de experiência com RPG?",
  key_question: true
)

answers = [Answer.create(
  question: question,
  description: "Nunca Joguei"
),
Answer.create(
  question: question,
  description: "Jogo a menos de 1 ano"
),
Answer.create(
  question: question,
  description: "Jogo entre 1 e 3 anos"
),
Answer.create(
  question: question,
  description: "Jogo a mais de 3 anos"
)]

puts 'Perguntas criadas'