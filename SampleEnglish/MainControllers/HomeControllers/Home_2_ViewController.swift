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
    @IBOutlet weak var nextButton: UIButton!
    
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
    
    //画面の初期表示の設定
    func firstSetting() {
        meaningLabel.isHidden = true //初めは単語の意味を非表示にする
        
    }
    
    // csvデータの単語をアプリに表示する
    func setData() {
        var wordData: [String] = []  //No.1の単語のデータを取得する配列を設定
        wordData = csvArray[number - 1].components(separatedBy: ",")  //配列にデータを挿入
        mainWord.text = wordData[0]  //単語を表示する
        meaningLabel.text = wordData[1] //単語の意味を表示する
        
    }
    
    // 問題数を数える
    func countNumber() {
        number += 1
        wordCount.text = "No." + String(number)
    }
    
    //NextボタンまたはAnswerボタンを押した際の処理
    @IBAction func goToNextWordAction(_ sender: Any) {
        if meaningLabel.isHidden == true {
            meaningLabel.isHidden = false
            nextButton.setTitle("Next", for: .normal)
        }
        else {
            countNumber()
            setData()
            meaningLabel.isHidden = true
            nextButton.setTitle("Answer", for: .normal)
            
        }
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
