//
//  Question.swift
//  QuizTwo
//
//  Created by user248714 on 3/13/24.
//

import Foundation

class Question {
    final var questionText: String
    var answers: [String]
    var rightAnswerInx: Int
    var points: Int
    
    init(text: String, answers: [String], rightAnswerInx: Int, points: Int) {
        self.questionText = text
        self.answers = answers
        self.rightAnswerInx = rightAnswerInx
        self.points = points
    }
    
    func getQuestionText() -> String {
        return questionText
    }
    func getAnswers() -> [String] {
        return answers
    }
    func getRightAnswer() -> String {
        return answers[rightAnswerInx]
    }
    func getPoints() -> Int {
        return points
    }
    func setPoints(newPoints: Int) {
        self.points = newPoints
    }
}
