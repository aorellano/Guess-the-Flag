//
//  ViewController.swift
//  Project2
//
//  Created by Alexis Orellano on 3/20/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var questionCtr = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion(action: nil)
    }
    func askQuestion(action: UIAlertAction!){
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased())                      Score: \(score)"
        if questionCtr == 10{
            let ac = UIAlertController(title: "Final Score", message: "\(score) out of 10", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(ac, animated: true)
        }
        questionCtr += 1
    }
    @IBAction func buttonTapped(_ button: UIButton) {
        var title: String
        var message: String
        if (button as AnyObject).tag == correctAnswer {
            score += 1
            title = "Correct"
            message = "Your score is \(score)"
        } else {
            title = "Wrong!"
            message = "That is the flag of \(countries[(button as AnyObject).tag].uppercased())"
        }
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: askQuestion))
        
        
        UIView.animate(withDuration: 0.4, animations: {
            button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { finished in
            button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.present(ac, animated: true)
        }
        
    }
}

