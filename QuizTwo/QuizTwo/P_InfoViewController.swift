//
//  InfoViewController.swift
//  Quiz
//
//  Created by user248714 on 2/23/24.
//

import UIKit

class P_InfoViewController: UIViewController {
    var infoText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray4
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        label.text = infoText
        label.frame = CGRect(x: 15, y: 10, width: 300, height: 500)
        view.addSubview(label)
    }
    
    func setInfo(s: String) {
        infoText = s
    }
}
