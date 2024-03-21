//
//  ViewController.swift
//  Quiz
//
//  Created by user248714 on 2/16/24.
//

import UIKit

protocol UserAnswerDelegate {
    func getUserTFAnswer(answer :Bool)
    func getUserSAAnswer(answer :String)
}

class TFQuizViewController: UIViewController {

    var delegate: UserAnswerDelegate?
    var questionText = ""
    var information = ""
    
    @IBOutlet weak var QuestionNumber: UILabel!
    @IBOutlet weak var QuizQuestion: UILabel!
    @IBOutlet weak var Score: UILabel!
    enum TrueFalse: Int {
        case trueButton
        case falseButton
    }
    
    var timer = Timer()
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuizQuestion.text = questionText
    }
    
    @IBAction func getInfo(_ sender: UIButton) {
        //let infoVC = InfoViewController()
        //infoVC.setInfo(s: "hello world")
        //present(infoVC, animated: true)
        
        self.performSegue(withIdentifier: "toInfoVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "toInfoVC" {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.loadViewIfNeeded()
            destinationVC.setInfoText(s: information)
        }
    }

    @IBAction func userAnswer(_ sender: UIButton) {
        switch sender.tag {
        case TrueFalse.trueButton.rawValue:
            delegate?.getUserTFAnswer(answer: true)
            //checkAnswer(true)
        case TrueFalse.falseButton.rawValue:
            delegate?.getUserTFAnswer(answer: false)
        default:
            print("error has occured")
        }
        self.dismiss(animated: true)
    }
}

