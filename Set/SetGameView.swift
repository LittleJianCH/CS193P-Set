//
//  SetGameView.swift
//  CS193P-Set
//
//  Created by LittleJian on 7/30/22.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var modal: GameModal
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(modal.cardsOnTable) { card in
                    CardView(card: card)
                        .aspectRatio(2 / 3, contentMode: .fit)
                        .onTapGesture {
                            modal.choose(card)
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameModal()
        
        SetGameView(modal: game)
    }
}
