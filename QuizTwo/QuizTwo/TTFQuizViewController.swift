//
//  TTFQuizViewController.swift
//  QuizTwo
//
//  Created by user248714 on 3/20/24.
//

import UIKit

class TTFQuizViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: UserAnswerDelegate?
    var questionText = ""
    

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var timerBar: UIProgressView!
    enum TrueFalse: Int {
        case trueButton
        case falseButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questionText
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userAnswer(_ sender: UIButton) {
        switch sender.tag {
        case TrueFalse.trueButton.rawValue:
            delegate?.getUserTFAnswer(answer: true)
            //checkAnswer(true)
        case TrueFalse.falseButton.rawValue:
            delegate?.getUserTFAnswer(answer: false)
            //checkAnswer(false)
        default:
            print("default")
        }
        self.dismiss(animated: true)
        
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
