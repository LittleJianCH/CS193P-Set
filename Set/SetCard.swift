//
//  SetCard.swift
//  CS193P-Set
//
//  Created by LittleJian on 7/30/22.
//

import Foundation

enum CardNumber {
    case one, two, three
}

enum CardShape {
    case diamond, squiggle, oval
}

enum CardShading {
    case solid, striped, open
}

enum CardColor {
    case red, green, purple
}

struct Card: Equatable {
    let number: CardNumber
    let shape: CardShape
    let shading: CardShading
    let color: CardColor
    var isFlipped = false
    
    mutating func flip() {
        isFlipped = !isFlipped
    }
}
