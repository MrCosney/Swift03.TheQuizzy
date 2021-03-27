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
        Question(text: "Какое животное тебе ближе?", type: .single, answers: [
            Answer(text: "Утка", person: .joey),
            Answer(text: "Петух", person: .chandler),
            Answer(text: "Крыса", person: .fibi),
            Answer(text: "Обезьяна", person: .rose),
            Answer(text: "Собака", person: .monica),
            Answer(text: "Кошка", person: .rachel)
        ].shuffled()),
        Question(text: "Какой ваш любимый напиток?", type: .single, answers: [
            Answer(text: "Айс Ти", person: .rose),
            Answer(text: "Черный кофе", person: .chandler),
            Answer(text: "Латте", person: .joey),
            Answer(text: "Кофе Декаф", person: .monica),
            Answer(text: "Капучино", person: .fibi),
            Answer(text: "Какао", person: .rachel)
        ].shuffled()),
        Question(text: "Мои талант(ы) это:", type: .multiple, answers: [
            Answer(text: "Гитара", person: .fibi),
            Answer(text: "Смешные шутки", person: .chandler),
            Answer(text: "Ум", person: .rose),
            Answer(text: "Готовка", person: .monica),
            Answer(text: "Есть и не толстеть", person: .joey),
            Answer(text: "Мода", person: .rachel)
        ].shuffled()),
        Question(text: "Что бы ты выбрал: секс или еда?", type: .slider, answers: [
            Answer(text: "Еда!", person: .monica),
            Answer(text: "Еда", person: .chandler),
            Answer(text: "Затрудняюсь ответить", person: .rachel),
            Answer(text: "Cекс с перервыом на еду", person: .joey),
            Answer(text: "Секс", person: .rose),
            Answer(text: "Секс!", person: .fibi)
        ]),
        ]
}
