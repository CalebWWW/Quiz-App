//
//  QuizViewController.swift
//  QuizTwo
//
//  Created by user248714 on 3/15/24.
//

import UIKit

class QuizViewController: UIViewController, UserAnswerDelegate {
    func getUserTFAnswer(answer: Bool) {
        if answer == quiz.getTFAnswer(i: currentInx) {
            isCorrect(correct: true)
        } else {
            isCorrect(correct: false)
        }
    }
    
    func getUserSAAnswer(answer: String) {
        if answer == quiz.getSAAnswer(i: currentInx) {
            isCorrect(correct: true)
        } else {
            isCorrect(correct: false)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var pointLabels: [UILabel]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quiz = QuestionBank()

    var totalPoints = 0

    var score = 0 {

            didSet {

                scoreLabel.adjustsFontSizeToFitWidth = true

                scoreLabel.text = "Score: \(score) / \(totalPoints)"

            }

        }

        var currentInx = -1

    @IBAction func Reset(_ sender: UIButton) {
    }
    
    //attatch
    @IBAction func getQuestion(_ sender: UIButton) {
        currentInx = sender.tag
        switch quiz.getQuestionType(i: currentInx) {
        case .trueFalse:
            self.performSegue(withIdentifier: "toTFQuestionVC", sender: self)
        case .shortAnswer:
            self.performSegue(withIdentifier: "toSAQuestionVC", sender: self)
        case .timed:
            self.performSegue(withIdentifier: "toTTFQuestionVC", sender: self)
        }
    }
    
    func isCorrect(correct: Bool) {
        let s = quiz.getPoints(i: currentInx)
        if correct {
            score += s
            pointLabels[currentInx].text = "\(s)/\(s)"
        } else {
            score -= s
            pointLabels[currentInx].text = "0/\(s)"
        }
    }
    
    func setLabels() {
        score = 0
        totalPoints = quiz.getTotalPoints()
        for i in 0 ..< quiz.getNumOfQuestions() {
            pointLabels[i].text = "0/\(quiz.getPoints(i: currentInx)) points"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTFQuestionVC" {
            let destinationVC = segue.destination as! TFQuizViewController
            
            destinationVC.questionText = quiz.getQuestionText(i: currentInx)
            destinationVC.information = quiz.getTFInformation(i: currentInx)
            destinationVC.delegate = self
        }
        
        if segue.identifier == "toSAQuestionVC" {
            let destinationVC = segue.destination as! SAQuizViewController
            
            destinationVC.questionText = quiz.getQuestionText(i: currentInx)
            destinationVC.delegate = self
        }
        
        if segue.identifier == "toTTFQuestionVC" {
            let destinationVC = segue.destination as! TTFQuizViewController
            
            destinationVC.questionText = quiz.getQuestionText(i: currentInx)
            destinationVC.delegate = self
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
