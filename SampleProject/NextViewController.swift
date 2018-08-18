//
//  NextViewController.swift
//  SampleProject
//
//  Created by atari on 2018/08/18.
//  Copyright © 2018年 atari. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIButton(frame: CGRect(x:0, y:0, width:100, height:100))
        backButton.setTitle("back", for: .normal)
        backButton.backgroundColor = UIColor.white
        backButton.addTarget(self, action: #selector(NextViewController.back(_:)), for: .touchUpInside)
        view.addSubview(backButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
