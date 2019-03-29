//
//  ViewController.swift
//  Concentration
//
//  Created by liutian on 2019/3/27.
//  Copyright © 2019 liutian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationModel(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount: Int = 0 {
        //属性观察器：在每次flipCount的值改变的时候走以下的方法。
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    var emojiChoices = ["🎃","👻","🦇","😱","🙀","👿","🍭","🍬","🍎"]
    
    var emoji = [Int: String]()
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet var renewButton: UIButton!

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBAction func touchRenewButton(_ sender: Any) {
        game.renew()
        for index in cardButtons.indices {
            cardButtons[index].setTitle("", for: .normal)
            cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        flipCount = 0
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

