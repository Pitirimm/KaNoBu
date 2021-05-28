//
//  ViewController.swift
//  KaNoBu
//
//  Created by Yuriy Martinovskiy on 28.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var opositeLabel: UILabel!
    @IBOutlet weak var kanobuLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
    }
    
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        let result = sign.getResult(for: computerSign)
        opositeLabel.text = computerSign.emoji
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            scissorsButton.isHidden = true
            paperButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            scissorsButton.isHidden = false
            paperButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            scissorsButton.isHidden = true
            paperButton.isHidden = false
        }
        resetButton.isHidden = false
        
        switch result {
        case .win:
            kanobuLabel.text = "Ты победил!"
            self.view.backgroundColor = UIColor.green
        case .lose:
            kanobuLabel.text = "Ты проиграл!"
            self.view.backgroundColor = UIColor.red
        case .draw:
            kanobuLabel.text = "Ничья!"
            self.view.backgroundColor = UIColor.gray
        case .start:
            reset()
        }
    }
    
    func reset() {
        kanobuLabel.text = "Камень, ножницы или бумага?"
        self.view.backgroundColor = UIColor.white
        rockButton.isHidden = false
        scissorsButton.isHidden = false
        paperButton.isHidden = false
        resetButton.isHidden = true
        opositeLabel.text = "❓"
    }

    @IBAction func rockTapped(_ sender: UIButton) {
        play(.rock)
    }
    @IBAction func scissorsTapped(_ sender: UIButton) {
        play(.scissors)
    }
    @IBAction func paperTapped(_ sender: UIButton) {
        play(.paper)
    }
    @IBAction func resetTapped(_ sender: UIButton) {
        reset()
    }
    
}

