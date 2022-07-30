//
//  SetGame.swift
//  CS193P-Set
//
//  Created by LittleJian on 7/30/22.
//

import Foundation

class SetGame {
    private var cardDeck: [Card]
    private(set) var cardsOnTable: [Card]
    var score: Int
    
    private var flipCard: [Card] {
        get { cardsOnTable.filter({ $0.isFlipped }) }
    }
    
    private var flipCount: Int {
        get { flipCard.count }
    }
    
    init() {
        score = 0
        
        cardsOnTable = []
        
        cardDeck = [.one, .two, .three].flatMap { n in
            [.diamond, .squiggle, .oval].flatMap { sp in
                [.solid, .striped, .open].flatMap { sh in
                    [.red, .green, .purple].flatMap { c in
                        [Card(number: n, shape: sp, shading: sh, color: c)]
                    }
                }
            }
        }.shuffled()
    }
    
    func deckCount() -> Int {
        cardDeck.count
    }
    
    private func flipCard(_ card: Card) {
        for i in cardsOnTable.indices {
            if cardsOnTable[i] == card {
                cardsOnTable[i].flip()
            }
        }
    }
    
    func choose(_ card: Card) {
        flipCard(card)
        
        if isaSet(flipCard) {
            cardsOnTable.removeAll(where: { flipCard.contains($0) })
            score += 1
        }
    }
    
    func deelOutCards(_ n: Int = 3) {
        if cardDeck.count > n {
            for _ in 0..<n {
                cardsOnTable.append(cardDeck.popLast()!)
            }
        }
    }
    
    private func isaSet<T: Equatable>(_ items: [T]) -> Bool {
        if items.count != 3 {
            return false
        } else if (items[0] == items[1] && items[1] == items[2]) {
            return true
        } else if (items[0] != items[1] && items[1] != items[2] && items[0] != items[2]) {
            return true
        } else {
            return false
        }
    }
    
    func hasSet() -> Bool {
        let cards = cardsOnTable
        let n = cards.count
        
        for i1 in 0..<n {
            for i2 in 0..<i1 {
                for i3 in 0..<i2 {
                    if isaSet([cards[i1], cards[i2], cards[i3]]) {
                        return true
                    }
                }
            }
        }
        
        return false
    }
}
