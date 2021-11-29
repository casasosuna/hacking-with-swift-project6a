//
//  ViewController.swift
//  Project2
//
//  Created by Enrique Casas on 7/18/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var correctAnswer = 0
    var score = 0
    var countries = [String]()
    var timesAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(shareTapped))
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
        
        
        // Do any additional setup after loading the view.
        }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + " \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            timesAsked += 1
        } else {
            title = "Wrong"
            score -= 1
            timesAsked += 1
        }
        
        if timesAsked >= 10 && title == "Correct" {
            let ac = UIAlertController(title: title, message: "Your final score is \(score)" + " and we have asked \(timesAsked) times", preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: askQuestion))
            present(ac, animated: true)
        }
        else if timesAsked < 10 && title == "Correct" {
            let ac = UIAlertController(title: title, message: "Your score is \(score)" + " and we have asked \(timesAsked) times", preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: askQuestion))
            present(ac, animated: true)
        } else if timesAsked >= 10 && title == "Wrong" {
            let ac = UIAlertController(title: title, message: "Wrong! That's the flag of \(countries[correctAnswer]) and your final score is \(score)", preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: askQuestion))
            present(ac, animated: true)
        } else if timesAsked < 10 && title == "Wrong" {
            let ac = UIAlertController(title: title, message: "Wrong! That's the flag of \(countries[correctAnswer])", preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: askQuestion))
            present(ac, animated: true)
        }
    }
    
    @objc func shareTapped() {
        print(score)
        let vc = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .actionSheet)
        vc.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: askQuestion))
        present(vc, animated: true)
    }
}



/* else if sender.tag == correctAnswer && timesAsked >= 10 {
    title = "Correct"
    let fc = UIAlertController(title: title, message: "Your final score is \(score).", preferredStyle: .alert)
    fc.addAction(UIAlertAction(title: "Done", style: .cancel, handler: askQuestion))
    present(fc, animated: true)
} else if sender.tag != correctAnswer && timesAsked >= 10 {
    title = "Correct"
    let fc = UIAlertController(title: title, message: "Your final score is \(score).", preferredStyle: .alert)
    fc.addAction(UIAlertAction(title: "Done", style: .cancel, handler: askQuestion))
    present(fc, animated: true)
} */
