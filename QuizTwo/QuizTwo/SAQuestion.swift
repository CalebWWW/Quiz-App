//
//  SAQuestion.swift
//  QuizTwo
//
//  Created by user248714 on 3/13/24.
//

import Foundation

class SAQuestion: Question {
    var caseSensitive: Bool
    init(text: String, answer: String, caseSensitive: Bool, points: Int) {
        self.caseSensitive = caseSensitive
        super.init(text: text, answers: [answer], rightAnswerInx: 0,
                   points: points)
    }
    func isCaseSensitive() -> Bool {
        return self.caseSensitive
    }
    func setCaseSensitive(caseSensitive: Bool) {
        self.caseSensitive = caseSensitive
    }
}
