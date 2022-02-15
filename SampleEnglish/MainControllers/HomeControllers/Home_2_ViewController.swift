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
    
    var number :Int = 1  //問題数を表示する際に用いた変数
    var csvArray: [String] = []  //csvデータを配列にする際に用いる空の配列
    
    // csvのデータを配列に変換する
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("エラー")
        }
        return csvArray
    }
    
    func firstSetting() {
        var firstData: [String] = []  //No.1の単語のデータを取得する配列を設定
        firstData = csvArray[0].components(separatedBy: ",")  //配列にデータを挿入
        mainWord.text = firstData[0]  //単語を表示する
        meaningLabel.text = firstData[1] //単語の意味を表示する
        
        
        
    }
    
    
    
    // 次の単語を表示する際に問題数No.を1増やす
    @IBAction func goToNextWordAction(_ sender: Any) {
        number += 1
        wordCount.text = "No." + String(number)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        csvArray = loadCSV(fileName: "sample_data")
        firstSetting()

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
