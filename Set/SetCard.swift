//
//  SetCard.swift
//  CS193P-Set
//
//  Created by LittleJian on 7/30/22.
//

import Foundation

enum CardNumber: String {
    case one, two, three
}

enum CardShape: String {
    case diamond, squiggle, oval
}

enum CardShading: String {
    case solid, striped, open
}

enum CardColor: String {
    case red, green, purple
}

struct Card: Equatable, Identifiable {
    let number: CardNumber
    let shape: CardShape
    let shading: CardShading
    let color: CardColor
    var isFlipped = false
    var highlight = false
    let id: Int
    
    mutating func flip() {
        isFlipped = !isFlipped
    }
}
