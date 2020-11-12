//
//  AnimalType.swift
//  lesson 4
//
//  Created by Andrey on 05.11.2020.
//

enum AnimalType: String {
    case dog = "🐶"
    case cat = "🐱"
    case turtle = "🐢"
    case rabbit = "🐰"
    var definition: String {
        switch self {
        case .dog:
        return "Вам нравится быть с друзьями, вы окружаете себя людьми которые вам приятны и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме, любите гулять сами по себе. Вы цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. Здоровы и полны энергией"
        case .turtle:
            return "Ваша сила в мудрости, медленный и вдумчивый на дальных дистанциях."
        
        }
    }
}
