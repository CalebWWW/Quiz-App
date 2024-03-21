//
//  InfoViewController.swift
//  Quiz
//
//  Created by user248714 on 2/23/24.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var InformationBox: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        InformationBox.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Close(_ sender: UIButton) {
        
    }
    
    func setInfoText(s: String) {
        InformationBox.text = s
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
