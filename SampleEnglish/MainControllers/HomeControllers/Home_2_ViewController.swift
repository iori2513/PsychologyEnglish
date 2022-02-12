//
//  Home_2_ViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/11.
//

import UIKit

class Home_2_ViewController: UIViewController {

    @IBOutlet weak var wordCount: UILabel!
    @IBOutlet weak var mainWord: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    
    var number :Int = 1
    
    // csvのデータを配列に変換する
    func csvToArray () {
       if let csvPath = Bundle.main.path(forResource: "sample_data", ofType: "csv") {
          do {
             let csvStr = try String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
             let csvArr = csvStr.components(separatedBy: .newlines)
             print(csvArr)
          } catch let error as NSError {
             print(error.localizedDescription)
          }
       }
    }
    
    
    
    
    // 次の単語を表示する際にNoを１ずつ増加させる
    @IBAction func goToNextWordAction(_ sender: Any) {
        number += 1
        wordCount.text = "No." + String(number)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
