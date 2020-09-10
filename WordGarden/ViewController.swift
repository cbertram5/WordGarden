//
//  ViewController.swift
//  WordGarden
//
//  Created by Chris Bertram on 9/10/20.
//  Copyright © 2020 Chris Bertram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wordsGuessedLabel: UILabel!
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    @IBOutlet weak var wordsMissedLabel: UILabel!
    @IBOutlet weak var wordsInGameLabel: UILabel!
    @IBOutlet weak var wordsBeingRevealedLabel: UILabel!
    @IBOutlet weak var guessedTextLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameStatusMessageLabel: UILabel!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = guessedTextLetterField.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
    }
    
    func updateUIAfterGuess() {
        guessedTextLetterField.resignFirstResponder()
        guessedTextLetterField.text! = ""
        guessLetterButton.isEnabled = false

    }
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        let text = guessedTextLetterField.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
     }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        // this dismisses the keyboard
        updateUIAfterGuess()
    }
 
    
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        // this dismisses the keyboard
        updateUIAfterGuess()
        
    }
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    

}

