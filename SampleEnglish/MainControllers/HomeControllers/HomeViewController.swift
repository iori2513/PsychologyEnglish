//
//  HomeViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/01/16.
//

import UIKit

class HomeViewController: UIViewController {
    
    //Home_3_ViewのHome画面に戻るボタンと紐付けるための記述
    @IBAction func unwindSegue(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserData().username)
        print(UserData().wordArray)
        // Do any additional setup after loading the view.
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
