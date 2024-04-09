//
//  ViewController.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 08.04.2024.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        let label = UILabel()
        label.text = "Hello world!"
        
        label.frame = CGRect(x: 100, y: 50, width: 100, height: 100)
        view.addSubview(label)
    }


}

