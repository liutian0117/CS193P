//
//  ViewController.swift
//  PlayingCard
//
//  Created by liutian on 2019/5/14.
//  Copyright © 2019 liutian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }


}

