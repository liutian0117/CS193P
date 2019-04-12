//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by liutian on 2019/3/28.
//  Copyright © 2019 liutian. All rights reserved.
//

import Foundation

struct ConcentrationModel {
    
    private(set) var cards = [Card]()
    
    // computed properties：
    // get方法在user想要获取属性的值的时候调用。
    // set方法在user给属性赋值的时候调用，默认变量为newValue。
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter {
                cards[$0].isFaceUp
            }.oneAndOnly
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
            
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "ConcentrationModel.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "ConcentrationModel.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card() 
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    mutating func renew() {
        for index in cards.indices {
            cards[index].isMatched = false
            cards[index].isFaceUp = false
        }
        indexOfOneAndOnlyFaceUpCard = nil
        cards.shuffle()
    }
}
extension Collection {
    //通过扩展完成筛选是否存在单独的一张正面朝上的卡片
    //String.element's Type: character;
    //Array.index's Type: Int.
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
