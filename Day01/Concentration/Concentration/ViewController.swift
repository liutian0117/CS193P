//
//  ViewController.swift
//  Concentration
//
//  Created by liutian on 2019/3/27.
//  Copyright © 2019 liutian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount: Int = 0 {
        //属性观察器：在每次flipCount的值改变的时候走以下的方法。
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["🎃","👻","🎃","👻"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func touchCard(_ sender: UIButton) {
        flipCountAdd()
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = UIColor.white
        }
    }
    
    func flipCountAdd() {
        flipCount += 1
    }
    
}

