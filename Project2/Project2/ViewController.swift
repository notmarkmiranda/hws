//
//  ViewController.swift
//  Project2
//
//  Created by Mark Miranda on 6/14/19.
//  Copyright © 2019 Mark Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var round = 1
    
    @IBOutlet weak var buton1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        buton1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        buton1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        buton1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) | Score: \(score)"
    }
    
    func restartGame(action: UIAlertAction!) {
        score = 0
        round = 1
        
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, that was \(countries[sender.tag].capitalized)."
            score -= 1
        }
        
        round += 1
        
        if round < 11 {
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Game Over!", message: "Your final score is \(score)!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: restartGame))
            present(ac, animated: true)
        }
    }
}

