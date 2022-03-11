//
//  Home_2_ViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/11.
//

import UIKit
import Foundation

class Test_2_ViewController: UIViewController {

    @IBOutlet weak var wordCount: UILabel!
    @IBOutlet weak var mainWord: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkSwitch: UISwitch!
    
    
    var number :Int = 1  //問題数を表示する際に用いた変数
    var csvArray: [String] = []  //csvデータを配列にする際に用いる空の配列
    var switchArray: [Int] = []  //switchをONにした単語を記録するための配列
    var arrayNumber :Int = 0 //csvデータの要素数を数える変数
    var dataName: String = "" //どの単語のデータを選択するかを決める変数で値はTest_1_ViewControllerから引き継いでくる
    var checkedWordArray :[String] = []  //checkをつけた単語のデータを入れる配列
    // csvのデータを配列に変換する
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            print(csvData)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            print(lineChange)
            csvArray = lineChange.components(separatedBy: "\n\n")
            csvArray.removeLast()
            
        } catch {
            print("エラー")
        }
        return csvArray
    }
    
    //初期設定
    func firstSetting() {
        csvArray = loadCSV(fileName: "\(dataName)")  //csvデータを読み込み、配列に変換する
        csvArray.shuffle()
        print(csvArray)
        arrayNumber = csvArray.count
        meaningLabel.isHidden = true //初めは単語の意味を非表示にする
        setData()
        
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
        if number < arrayNumber {
            if meaningLabel.isHidden == true {
                meaningLabel.isHidden = false
                nextButton.setTitle("Next", for: .normal) //ボタンの文字を変える
            }
            else {
                meaningLabel.isHidden = true
                countNumber()
                setData()  //次の問題のデータを読み込む
                nextButton.setTitle("Answer", for: .normal)
                checkSwitch.isOn = false
            }
        }
        else {
            if meaningLabel.isHidden == true {
                meaningLabel.isHidden = false
                nextButton.setTitle("Finish!", for: .normal) //ボタンの文字を変える
            }
            else {
                //単語を全て表示したら次の画面へ移行
                putWordInCheckedWordArray()
                performSegue(withIdentifier: "result", sender: nil)
                
            }
        }
        
    }
    
    //SwitchをONにするとその単語にチェックをつける
    @IBAction func checkButtonAction(_ sender: UISwitch) {
        if sender.isOn {
            switchArray += [number - 1]
        }
        if sender.isOn == false {
            switchArray.removeLast()
        }
    }
    
    //checkedWordArrayにチェックされた単語を代入する
    func putWordInCheckedWordArray() {
        for num in switchArray {
            checkedWordArray += [csvArray[num]]
        }
    }
    
    //終了ボタンを押した際の処理
    @IBAction func pushedExitButton(_ sender: Any) {
        putWordInCheckedWordArray()
        self.performSegue(withIdentifier: "result", sender: nil)
    }
    
    
    // 変数の引き継ぎ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Home_3_VC = segue.destination as! Test_3_ViewController
        Home_3_VC.switchArray = switchArray
        Home_3_VC.checkedWordArray = checkedWordArray
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
