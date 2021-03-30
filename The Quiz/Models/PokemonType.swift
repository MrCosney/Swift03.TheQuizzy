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
    case pidgey = "ПИДЖУ"
    case slowpoke = "СЛОУПОК"
    
    var description: String {
        switch self {
        case .pikachu:
            return "Обаятельный и очень энергичный покемон, всегда прийдет на помощь своим друзьям!"
        case .squirtle:
            return ""
        case .charmander:
            return ""
        case .snorlaks:
            return ""
        case .pidgey:
            return ""
        case .slowpoke:
            return ""
        }
        
    }
}
