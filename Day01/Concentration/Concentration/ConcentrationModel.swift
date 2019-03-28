//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by liutian on 2019/3/28.
//  Copyright © 2019 liutian. All rights reserved.
//

import Foundation

class ConcentrationModel {
    var cards = [Card]()
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card() 
            cards += [card, card]
        }
    }
    // TODO: Shuffle the cards.
}
