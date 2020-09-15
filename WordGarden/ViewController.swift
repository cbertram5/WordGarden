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
    
    @IBOutlet weak var wordBeingRevealedLabel: UILabel!
    @IBOutlet weak var guessedTextLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameStatusMessageLabel: UILabel!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    var wordsToGuess = ["SWIFT", "DOG", "CAT"]
    var currentWordIndex = 0
    var wordToGuess = ""
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var wordsGuessedCount = 0
    var wordsMissedCount = 0
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = guessedTextLetterField.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
        wordToGuess = wordsToGuess[currentWordIndex]
        wordBeingRevealedLabel.text = "_" + String(repeating: " _", count: wordToGuess.count-1)
        updateGameStatusLabels()

    }
    
    func updateUIAfterGuess() {
        guessedTextLetterField.resignFirstResponder()
        guessedTextLetterField.text! = ""
        guessLetterButton.isEnabled = false
    }
    
    func formatRevealedWord() {
         // format and show revealedWord in wordBeing revealedLabel to include new guess
        var revealedWord = ""

        // loop through all the letters in wordToGuess
        for letter in wordToGuess {
            // check if letter in wordToGuess is in lettersGuessed (i.e. did you guess this letter already?
            if lettersGuessed.contains(letter) {
                // if so, add this letter + a blank space, to revealWord
                revealedWord = revealedWord + "\(letter) "
            } else {
                // if not, add anunderscore + a blank space, to revealedWord
                revealedWord = revealedWord + "_ "
            }
        }
        // remove the extra space at the end of revealedWord
        revealedWord.removeLast()
        wordBeingRevealedLabel.text = revealedWord
    }
    
    func updateAfterWinOrLose() {
        // what to do if game is over?
        
        currentWordIndex += 1
        guessedTextLetterField.isEnabled = false
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = false
        
        updateGameStatusLabels()
    }
    
    func updateGameStatusLabels() {
        // update labels at top of screen
        wordsGuessedLabel.text = "Words Missed: \(wordsGuessedCount)"
        wordsMissedLabel.text = "Words Remaining: \(wordsMissedCount)"
        wordsRemainingLabel.text = "Words to Guess: \(wordsToGuess.count - (wordsGuessedCount + wordsMissedCount))"
        wordsInGameLabel.text = "Words in Game: \(wordsToGuess.count)"

    }
    
    func guessALetter() {
        // get a current letter guessed and add it to all lettersGuessed
        let currentLetterGuessed = guessedTextLetterField.text!
        lettersGuessed = lettersGuessed + currentLetterGuessed
        
        formatRevealedWord()
        
        // update image, if needed and keep track of wrong guesses
        if wordToGuess.contains(currentLetterGuessed) == false {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        // update gameStatusMessage.label
        guessCount += 1
//        var guesses = "Guesses"
//        if guessCount == 1 {
//            guesses = "Guess"
//        }
        let guesses = (guessCount == 1 ? "Guess" : "Guesses")
        gameStatusMessageLabel.text = "You've Made \(guessCount) \(guesses)"
        
        // check for win or lose
        
        if wordBeingRevealedLabel.text!.contains("_") == false {
            gameStatusMessageLabel.text = "You've guessed it! It took you \(guessCount) guesses to guess the word."
            wordsGuessedCount += 1
            updateAfterWinOrLose()
        } else if wrongGuessesRemaining == 0 {
            gameStatusMessageLabel.text = "So sorry. You're all out of guesses."
            wordsMissedCount += 1
            updateAfterWinOrLose()
        }
        
        // check to see if you've played all the words, if so update the message indicating the player can restart the entire game.
        if currentWordIndex == wordsToGuess.count {
            gameStatusMessageLabel.text! += "\n\nYou've tried all of the words! Restart from the beginning?"
        }
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        sender.text = String(sender.text?.last ?? " ").trimmingCharacters(in: .whitespaces)
        guessLetterButton.isEnabled = !(sender.text!.isEmpty)
     }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        // this dismisses the keyboard
        updateUIAfterGuess()
    }
 
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        // this dismisses the keyboard
        updateUIAfterGuess()
        
    }
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        // hide the playAgainButton
        // enable letterGuessedTextField
        // disable guessALetterButton - it already is, though
        // currentWord SHould be set to next word
        // set wordBeingRevealed.text to underscored seperated by spaces
        // set the wrongGuessesRemaining to maxNumberOFWrongGuess
        // set guessCount = 0
        // set flowerImageView to flower8
        // clear out lettersGuessed, so new word restard wtih no letters guessed, or = ""
        // set gameStatuesMessageLabel.text to "You've Made Zero Guesses"
        if currentWordIndex == wordsToGuess.count {
            currentWordIndex = 0
            wordsGuessedCount = 0
            wordsMissedCount = 0
        }
        
        playAgainButton.isHidden = true
        guessedTextLetterField.isEnabled = true
        guessLetterButton.isEnabled = false // don't turn until character is in the text field
        wordToGuess = wordsToGuess[currentWordIndex]
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        // create the wword with underscores, one for each space
        wordBeingRevealedLabel.text = "_" + String(repeating: " _", count: wordToGuess.count-1)
        guessCount = 0
        flowerImageView.image = UIImage(named: "flower\(maxNumberOfWrongGuesses)")
        lettersGuessed = ""
        updateGameStatusLabels()
        gameStatusMessageLabel.text = "You've Made Zero Guesses"
    }
    

}

