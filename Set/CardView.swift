//
//  CardView.swift
//  CS193P-Set
//
//  Created by LittleJian on 7/30/22.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    func card2String(_ card: Card) -> String {
        return "\(card.number.rawValue) \n \(card.shape.rawValue) \n \(card.shading.rawValue) \n \(card.color.rawValue)"
    }
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 30)
            
            shape.foregroundColor(.white)
            Text(card2String(card)).font(.body)
            
            if card.isFlipped {
                shape.strokeBorder(lineWidth: 10).foregroundColor(.blue)
            } else if card.highlight {
                shape.strokeBorder(lineWidth: 10).foregroundColor(.yellow)
            } else {
                shape.strokeBorder(lineWidth: 10).foregroundColor(.black)
            }
        }
    }
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hi")
    }
}
