//
//  SetApp.swift
//  CS193P-Set
//
//  Created by LittleJian on 7/30/22.
//

import SwiftUI

@main
struct SetApp: App {
    var body: some Scene {
        WindowGroup {
            let game = GameModal()
            
            SetGameView(modal: game)
        }
    }
}
