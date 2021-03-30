//
//  Friend.swift
//  The Quiz
//
//  Created by Nick on 24.03.2021.
//

enum PokemonType: String {
    case pikachu = "ПИКАЧУ"
    case squirtle = " СКВИРТЛ"
    case charmander = "ЧАРМАНДЕР"
    case snorlaks = "СНОРЛАКС"
    case pidgey = "ПИДЖЕОТ"
    case slowpoke = "СЛОУПОК"
    
    var description: String {
        switch self {
        case .pikachu:
            return "Ты очень энергичный покемон! В тебе настолько много энергии, что ее не удержать в бутылке!"
        case .squirtle:
            return "Ты очень спокойный и размерянный, но иногда тебя невозможно контролировать!"
        case .charmander:
            return "Ты горяч как огонь, всегда готовый на новые подвиги и свершения!"
        case .snorlaks:
            return "Ты достаточно силен, чтобы никому ничего не доказывать и просто отдыхать."
        case .pidgey:
            return "Ты очень свободный и творческий покемон, предпочитающий ни от кого не зависеть. "
        case .slowpoke:
            return "Ты настолько погружен в свои размышления, что порой теряешь связь с реальным миром."
        }
        
    }
}
