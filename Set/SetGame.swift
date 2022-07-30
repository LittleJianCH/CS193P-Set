//
//  SetGame.swift
//  CS193P-Set
//
//  Created by LittleJian on 7/30/22.
//

import Foundation

struct SetGame {
    var cardDeck: [Card]
    var cardsOnTable: [Card]
    var score: Int
    
    private var flipCard: [Card] { cardsOnTable.filter({ $0.isFlipped }) }
    
    private var flipCount: Int { flipCard.count }
    
    init() {
        score = 0
        
        cardsOnTable = []
        
        cardDeck = []

        var curId: Int = 0
        for n: CardNumber in [.one, .two, .three] {
            for s: CardShape in [.diamond, .squiggle, .oval] {
                for h: CardShading in [.solid, .striped, .open] {
                    for c: CardColor in [.red, .green, .purple] {
                        cardDeck.append(Card(number: n, shape: s, shading: h, color: c, id: curId))
                        curId += 1
                    }
                }
            }
        }
        
        cardDeck.shuffle()
    }
    
    func deckCount() -> Int {
        cardDeck.count
    }
    
    mutating private func flipCard(_ card: Card) {
        for i in cardsOnTable.indices {
            if cardsOnTable[i] == card {
                cardsOnTable[i].flip()
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        flipCard(card)
        
        if flipCount == 3 {
            if isaSet(flipCard) {
                let cards = flipCard
                cardsOnTable.removeAll(where: { cards.contains($0) })
                score += 1
                
                while cardsOnTable.count < 12 || !hasSet() {
                    if cardDeck.count < 3 {
                        break
                    }
                    
                    deelOutCards()
                }
            } else {
                for i in cardsOnTable.indices {
                    cardsOnTable[i].isFlipped = false
                }
            }
        }
    }
    
    mutating func deelOutCards(_ n: Int = 3) {
        if cardDeck.count >= n {
            for _ in 0..<n {
                cardsOnTable.append(cardDeck.popLast()!)
            }
        }
    }
    
    private func equalOrUnique3<T: Equatable>(_ items: [T]) -> Bool {
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
    
    private func isaSet(_ cards: [Card]) -> Bool {
        return (equalOrUnique3(cards.map({ $0.number })) &&
                equalOrUnique3(cards.map({ $0.shape })) &&
                equalOrUnique3(cards.map({ $0.shading })) &&
                equalOrUnique3(cards.map({ $0.color })))
    }
    
    mutating func hasSet() -> Bool {
        // for easier test, I highlight a Set out
        // these function needn't to be mutating in release version
        let cards = cardsOnTable
        let n = cards.count
        
        for i1 in 0..<n {
            for i2 in 0..<i1 {
                for i3 in 0..<i2 {
                    if isaSet([cards[i1], cards[i2], cards[i3]]) {
                        cardsOnTable[i1].highlight = true
                        cardsOnTable[i2].highlight = true
                        cardsOnTable[i3].highlight = true
                        return true
                    }
                }
            }
        }
        
        return false
    }
}
