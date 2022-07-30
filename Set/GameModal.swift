//
//  GameModal.swift
//  CS193P-Set
//
//  Created by LittleJian on 7/30/22.
//

import Foundation

class GameModal: ObservableObject {
    
    var state: GameState = .start
    
    static private func createGame() -> SetGame {
        let game = SetGame()
        game.deelOutCards(12)
        return game
    }
    
    @Published private(set) var modal = createGame()
    
    func cardsOnTable() -> [Card] {
        modal.cardsOnTable
    }
    
    func score() -> Int {
        modal.score
    }
    
    func choose(_ card: Card) {
        modal.choose(card)
        
        while !modal.hasSet() {
            if modal.deckCount() == 0 {
                state = .over
                break
            }
            
            modal.deelOutCards()
        }
    }
    
    enum GameState {
        case start, running, over
    }
}
