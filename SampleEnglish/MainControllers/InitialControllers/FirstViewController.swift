//
//  ViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2021/10/17.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    //ナビゲーションバーを非表示にする
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

