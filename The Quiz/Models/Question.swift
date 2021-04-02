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
        Question(text: "Какая стихия тебе по душе?", type: .single, answers: [
            Answer(text: "Огонь", person: .charmander),
            Answer(text: "Эфир", person: .snorlaks),
            Answer(text: "Воздух", person: .pidgey),
            Answer(text: "Вода", person: .squirtle),
            Answer(text: "Земля", person: .slowpoke),
            Answer(text: "Электричество", person: .pikachu)
        ].shuffled()),
        Question(text: "Твой любимый фрукт?", type: .picker, answers: [
            Answer(text: "Арбуз", person: .squirtle),
            Answer(text: "Инжир", person: .snorlaks),
            Answer(text: "Питахайя", person: .charmander),
            Answer(text: "Личи", person: .slowpoke),
            Answer(text: "Персик", person: .pidgey),
            Answer(text: "Ананас", person: .pikachu)
        ].shuffled()),
        Question(text: "Как бы ты провел каникулы мечты:", type: .multiple, answers: [
            Answer(text: "Путешествия!", person: .pidgey),
            Answer(text: "Спать до полудня!", person: .snorlaks),
            Answer(text: "Рыбалка!", person: .squirtle),
            Answer(text: "Смотреть телевизор!", person: .slowpoke),
            Answer(text: "Пикники в лесу!", person: .charmander),
            Answer(text: "Тусить с друзьями!", person: .pikachu)
        ].shuffled()),
        Question(text: "Насколько ты активен?", type: .slider, answers: [
            Answer(text: "Z-z-z", person: .snorlaks),
            Answer(text: "Чуть-чуть", person: .slowpoke),
            Answer(text: "Жизнь бьет ключом!", person: .squirtle),
            Answer(text: "Я пламя!", person: .charmander),
            Answer(text: "Я как ветер!", person: .pidgey),
            Answer(text: "Меня не остановить!", person: .pikachu)
        ]),
        Question(text: "Какую музыку ты выберешь для вечеринки?", type: .single, answers: [
            Answer(text: "Классическую", person: .pidgey),
            Answer(text: "Никакой! Люблю тишину...", person: .snorlaks),
            Answer(text: "Послушаем Rap!", person: .squirtle),
            Answer(text: "Музыку?", person: .slowpoke),
            Answer(text: "Хард рок!", person: .charmander),
            Answer(text: "Электронную!", person: .pikachu)
        ].shuffled()),
        Question(text: "Какая погода тебе по душе?", type: .multiple, answers: [
            Answer(text: "Теплую с ветерком!", person: .pidgey),
            Answer(text: "Люблю зиму!", person: .snorlaks),
            Answer(text: "Сильный ливень!", person: .squirtle),
            Answer(text: "Погода?", person: .slowpoke),
            Answer(text: "Обожаю жару!", person: .charmander),
            Answer(text: "Люблю дождь с грозой!", person: .pikachu)
        ].shuffled()),
        Question(text: "Твой любимый вид спорта?", type: .picker, answers: [
            Answer(text: "Скайдайвинг!", person: .pidgey),
            Answer(text: "Ненавижу спорт!", person: .snorlaks),
            Answer(text: "Плавание!", person: .squirtle),
            Answer(text: "Спорт?", person: .slowpoke),
            Answer(text: "Пляжный волейбол!", person: .charmander),
            Answer(text: "Мото Гонки!", person: .pikachu)
        ].shuffled()),
        ]
}
