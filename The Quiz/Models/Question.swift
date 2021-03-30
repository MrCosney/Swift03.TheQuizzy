//
//  Question.swift
//  The Quiz
//
//  Created by Nick on 24.03.2021.
//

struct Question {
    let text: String
    let type: QuestionType
    let answers: [Answer]
    
    static let all: [Question] = [
        Question(text: "Какая стихия вам по душе?", type: .single, answers: [
            Answer(text: "Огонь", person: .charmander),
            Answer(text: "Эфир", person: .snorlaks),
            Answer(text: "Воздух", person: .pidgey),
            Answer(text: "Вода", person: .squirtle),
            Answer(text: "Земля", person: .slowpoke),
            Answer(text: "Электричество", person: .pikachu)
        ].shuffled()),
        Question(text: "Какой ваш любимый напиток?", type: .picker, answers: [
            Answer(text: "Айс Ти", person: .squirtle),
            Answer(text: "Черный кофе", person: .snorlaks),
            Answer(text: "Латте", person: .charmander),
            Answer(text: "Кофе Декаф", person: .slowpoke),
            Answer(text: "Капучино", person: .pidgey),
            Answer(text: "Какао", person: .pikachu)
        ].shuffled()),
        Question(text: "Мои талант(ы) это:", type: .multiple, answers: [
            Answer(text: "Гитара", person: .pidgey),
            Answer(text: "Смешные шутки", person: .snorlaks),
            Answer(text: "Ум", person: .squirtle),
            Answer(text: "Готовка", person: .slowpoke),
            Answer(text: "Есть и не толстеть", person: .charmander),
            Answer(text: "Мода", person: .pikachu)
        ].shuffled()),
        Question(text: "Насколько ты активен?", type: .slider, answers: [
            Answer(text: "Z-z-z", person: .slowpoke),
            Answer(text: "Еда", person: .slowpoke),
            Answer(text: "Затрудняюсь ответить", person: .pikachu),
            Answer(text: "Cекс с перервыом на еду", person: .charmander),
            Answer(text: "Секс", person: .squirtle),
            Answer(text: "Меня не остановить!", person: .pidgey)
        ]),
        ]
}
