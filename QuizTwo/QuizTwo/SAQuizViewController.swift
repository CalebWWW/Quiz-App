//
//  SAQuizViewController.swift
//  QuizTwo
//
//  Created by user248714 on 3/20/24.
//

import UIKit

class SAQuizViewController: UIViewController, UITextFieldDelegate {

    var questionText = ""
    var delegate: UserAnswerDelegate?
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var userInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionLabel.text = questionText
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submit(_ sender: Any) {
        let temp = userInput.text?.trimmingCharacters(in: [" "])
        delegate?.getUserSAAnswer(answer: temp!)
        self.dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userInput.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
