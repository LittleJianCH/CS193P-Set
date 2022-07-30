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
        var game = SetGame()
        
        game.deelOutCards(12)
        while !game.hasSet() {
            game.deelOutCards()
        }
        
        return game
    }
    
    @Published private(set) var modal = createGame()
    
    var cardsOnTable: [Card] { modal.cardsOnTable }
    
    var score: Int { modal.score }
    
    func choose(_ card: Card) {
        modal.choose(card)
        
        if !modal.hasSet() {
            state = .over
        }
    }
    
    enum GameState {
        case start, running, over
    }
}
