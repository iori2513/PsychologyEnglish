//
//  SecondViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/01/16.
//

import UIKit

class MyWordTest_1_ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func pushStartButton(_ sender: Any) {
        //単語帳に単語が存在しない場合は画面遷移させないようにする
        if UserData().wordArray != [] {
            performSegue(withIdentifier: "toMyWords", sender: nil)
        }
        else {
            confirmAlert()
        }
    }
    
    //アラートを表示する
    func confirmAlert() {
        let confirmAlert = UIAlertController(title: "確認", message: "My単語帳に単語がありません", preferredStyle: .alert)
        confirmAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            self.startButton.isSelected = false
        }))
        self.present(confirmAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //ナビゲーションバーを非表示にする
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
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
