//
//  TFFQuizViewController.swift
//  QuizTwo
//
//  Created by user248714 on 3/20/24.
//

import Foundation

class TTFQuestion: Question {
    var time: Int
    init(text: String, rightAnswer: Bool, points: Int, time: Int) {
        self.time = time
        super.init(text: text, answers: ["true", "false"], rightAnswerInx:
                    rightAnswer ? 0 : 1, points: points)
    }
    
    func setInformation(time: Int) {
        self.time = time
    }
    
    func getTime() -> Int {
        return self.time
    }
    
    func getTFAnswer() -> Bool {
        let ans = super.getRightAnswer()
        if ans == "true" {
            return true
        } else {
            return false
        }
    }
}
