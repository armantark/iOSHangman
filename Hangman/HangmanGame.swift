//
//  HangmanGame.swift
//  Hangman
//
//  Created by Arman Tarkhanian on 9/28/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import UIKit

class HangmanGame {
    let hangmanPhrases = HangmanPhrases()
    var guessedLetters: Set<String>
    var currentGuess: String
    var currentStage: Int
    var phrase: String
    var isWin = false
    var isLose = false
    
    // Generate a random phrase for the user to guess
    init() {
        phrase = hangmanPhrases.getRandomPhrase()
        currentGuess = ""
        currentStage = 1
        guessedLetters = []
        for i in 0...phrase.count-1 {
            if Array(phrase)[i] != " " {
                currentGuess += "_"
            } else {
                currentGuess += " "
            }
        }
    }
    func guess(guess: String?) {
        if var currletter = guess {
            currletter = currletter.uppercased()
            if currletter.count == 1 && !guessedLetters.contains(currletter) {
                var indices: [Int] = []
                for (index, letter) in phrase.enumerated() {
                    if letter == Character(currletter) {
                        indices.append(index)
                    }
                }
                for index in indices {
                    var liststr = Array(currentGuess)
                    liststr[index] = Character(currletter)
                    currentGuess = String(liststr)
                }
                if indices.count == 0 {
                    guessedLetters.insert(currletter)
                    currentStage += 1
                    if currentStage >= 7 {
                        isLose = true
                    }
                }
                if !currentGuess.contains("_"){
                    isWin = true
                }
            }
        }
        
    }
}
