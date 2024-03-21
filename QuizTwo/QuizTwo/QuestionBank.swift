//
//  Question.swift
//  Quiz
//
//  Created by user248714 on 2/16/24.
//

import Foundation

enum QuestionType {
    case trueFalse
    case shortAnswer
    case timed
}

struct QuestionBank {
    var questions: [(T: QuestionType, Q: Question)]
    
    init() {
        questions = [(T: QuestionType, Q: Question)]()
        addTFQuestion(questionText: "Macincloud is a good emulator program", answer: false, info: "I have written questions for this app three different times and Macincloud has erased them and reverted my save multiple times. This emulator is trash.", points: 2)
        addTTFQuestion(QuestionText: "Macincloud never crashes", answer: false, points: 3)
        addTFQuestion(questionText: "Macincloud is not reliable", answer: true, info: "It is completely hit or miss if the emulator will even start", points: 2)
        addTFQuestion(questionText: "Macincloud will not charge you if you spend too much time on the emulator", answer: false, info: "Not only will they charge you, it is inevitable that they will because the load times are so slow", points: 2)
        addSAQuestion(questionText: "How much money does Macincloud charge for its trash platform per month", answer: "27", caseSensitive: false, points: 5)
    }

    func getNumOfQuestions() -> Int {
        return questions.count
    }

    func getTotalPoints() -> Int {
        var total = 0
        for question in questions {
            total += question.1.points
        }
        return total
    }

    func getQuestionType(i: Int) -> QuestionType {
        return questions[i].T
    }

    func getQuestionText(i: Int) -> String {
        return questions[i].Q.getQuestionText()
    }

    func getTFAnswer(i: Int) -> Bool {
        let q = questions[i].Q as! TFQuestion
        return q.getTFAnswer()
        
    }

    func getSAAnswer(i: Int) -> String {
        return questions[i].Q.getRightAnswer()
    }

    func getPoints(i: Int) -> Int {
        return questions[i].Q.points
    }
    func getTFInformation(i: Int) -> String {
        let q = questions[i].Q as! TFQuestion
        return q.getInformation()
    }

    func getAnwers(i:Int) -> [String] {
        return questions[i].1.getAnswers()
    }
    
    mutating func shuffleQuestions() {
        questions = questions.shuffled() 
    }
    
    mutating func getNewQuiz(num: Int) {
        var newQuiz = QuestionBank()
        newQuiz.shuffleQuestions()
        let temp = newQuiz.questions[0 ..< num]
        self.questions = Array(temp)
    }
    
    mutating func addTFQuestion(questionText: String, answer: Bool, info: String, points: Int) {
        questions.append((QuestionType.trueFalse, Question(text: questionText, answers: [String(answer)], rightAnswerInx: 0, points: points)))
    }

    mutating func addSAQuestion(questionText: String, answer: String, caseSensitive: Bool, points: Int) {
        questions.append((QuestionType.shortAnswer, Question(text: questionText, answers: [answer], rightAnswerInx: 0, points: points)))
    }
    
    mutating func addTTFQuestion(QuestionText: String, answer: Bool, points: Int) {
        questions.append((QuestionType.timed, Question(text: QuestionText, answers: [String(answer)], rightAnswerInx: 0, points: points)))
    }
    
}
