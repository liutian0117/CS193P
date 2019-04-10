//
//  Card.swift
//  Concentration
//
//  Created by liutian on 2019/3/28.
//  Copyright © 2019 liutian. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    // 静态方法无法用实例Card调用，Type Card可以调用。（类似全局函数）
    private static func getUniqueIdentifier() -> Int {
    // 静态方法内静态函数不用调用Card.identifierFactory
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
