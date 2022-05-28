//
//  ViewController.swift
//  NhaDoUIKit
//
//  Created by Nguyễn Hoàng Văn Nhã on 5/24/22.
//

import UIKit

class ViewController: UIViewController {
    var scoreLabel: UILabel!
    
    override func loadView() {
        view = UIView()
           view.backgroundColor = .white
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "Daily Todos"
        view.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
                scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

