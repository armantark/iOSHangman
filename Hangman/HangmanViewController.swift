//
//  HangmanViewController.swift
//  Hangman
//
//  Created by Arman Tarkhanian on 9/28/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
        winAlertController.addAction(action)
        loseAlertController.addAction(action)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var game = HangmanGame()
    @IBOutlet weak var stage: UIImageView!
    @IBOutlet weak var phraselabel: UILabel!
    @IBOutlet weak var guessedletterslabel: UILabel!
    @IBOutlet weak var guesstextfield: UITextField!
    let winAlertController = UIAlertController(title: "Nice job", message: "You win!", preferredStyle: .alert)
    let loseAlertController = UIAlertController(title: "Womp womp", message: "You lose :(", preferredStyle: .alert)
    var action = UIAlertAction()
    
    @IBAction func guessbutton(_ sender: Any) {
        game.guess(guess: guesstextfield.text)
        guesstextfield.text = ""
        phraselabel.text = game.currentGuess
        if game.guessedLetters.count != 0 {
            guessedletterslabel.text = String(Array(game.guessedLetters).sorted().compactMap({$0}).joined(separator: " "))
        }
        stage.image = UIImage(named: "hangman" + String(game.currentStage))
        if game.isWin {
            self.present(winAlertController, animated: true, completion: nil)
        } else if game.isLose {
            self.present(loseAlertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func startOverButton(_ sender: Any) {
        startOver()
    }
    func startOver() {
        game = HangmanGame()
        phraselabel.text = game.currentGuess
        guessedletterslabel.text = "None"
        stage.image = #imageLiteral(resourceName: "hangman1")
        action = UIAlertAction(title: "New Game", style: .default, handler: {action in self.startOver()})
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
