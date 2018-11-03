//
//  ViewController.swift
//  SampleProject
//
//  Created by atari on 2018/06/27.
//  Copyright © 2018年 atari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Hello World!")
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        label.text = "Hello World!"
        self.view.addSubview(label)

        let nextButton = UIButton(frame: CGRect(x:0, y:0, width:100, height:100))
        nextButton.setTitle("Go!", for: .normal)
        nextButton.backgroundColor = UIColor.blue
        nextButton.addTarget(self, action: #selector(ViewController.goNext(_:)), for: .touchUpInside)
        view.addSubview(nextButton)

        print("start")

        let url = URL(string: "https://hogehoge/")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                // HTTPヘッダの取得
                print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                // HTTPステータスコード
                print("statusCode: \(response.statusCode)")
                // JSONからDictionaryへ変換
                let dic = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                print("status: \(dic["status"] as! Int)")
                print("releaseVersionName: \(dic["releaseVersionName"] as! String)")
            }
            }.resume()

        /*
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // 0.5秒後に実行したい処理
            print("end")
            self.goNextAuto()
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func goNext(_ sender: UIButton) {
        let nextvc = NextViewController()
        let navivc = UINavigationController(rootViewController: nextvc)
        nextvc.view.backgroundColor = UIColor.blue
        self.present(navivc, animated: true, completion: nil)
    }

    @objc func goNextAuto() {
        let nextvc = NextViewController()
        let navivc = UINavigationController(rootViewController: nextvc)
        nextvc.view.backgroundColor = UIColor.blue
        self.present(navivc, animated: true, completion: nil)
    }
}
