//
//  Home_3_ViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/16.
//

import UIKit

class Test_3_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var checkedWordTableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    var cellNumber: Int = 0  //tableViewCellの個数を表す変数で値はTest_2_ViewControllerから引き継いでくる
    var switchArray :[Int] = []  //Test_2_ViewControllerのswitchArrayを引き継ぐための配列
    var checkedWordArray :[String] = []  //checkをつけた単語のデータを入れる配列で値はTest_2_ViewControllerから引き継いでくる
    var userWordArray :[String] = []  //ユーザーのわからなかった単語をこの配列に入れてUserdefaultsに保存する
    var cellCheckedWordArray :[String] = []
    
    
    //tableViewCellの個数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkedWordArray.count
    }
    
    //tableViewCellに表示する内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "checkedWordCell", for: indexPath)
        cellCheckedWordArray = checkedWordArray[indexPath.row].components(separatedBy: ",")
        cell.textLabel!.text = cellCheckedWordArray[0] + "・・・" + cellCheckedWordArray[1]
        return cell
    }
    
    //tableViewCellを削除する処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print(checkedWordArray)
            checkedWordArray.remove(at: indexPath.row)
            checkedWordTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
        }        
    }
    
    
    //復習用単語に保存ボタンを押した際の処理
    @IBAction func saveCheckedWordButton(_ sender: Any) {
        //現在のユーザーの復習用単語のデータを参照し、今回のテストでわからなかった単語と被りがないように保存する
        userWordArray = UserData().wordArray
        var sameWordJudge: Bool = false
        for data in checkedWordArray {
            for userData in userWordArray {
                if data == userData {
                    sameWordJudge = true
                }
            }
            if sameWordJudge == false {
                userWordArray += [data]
            }
        }
        UserData().wordArray = userWordArray
        confirmAlert()
        print(UserData().wordArray)
    }
    
    //確認のアラート表示
    func confirmAlert() {
        let confirmAlert = UIAlertController(title: "確認", message: "保存しました", preferredStyle: .alert)
        confirmAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            self.saveButton.isSelected = false
        }))
        self.present(confirmAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func pushEditButton(_ sender: Any) {
        if checkedWordTableView.isEditing == false {
            checkedWordTableView.setEditing(true, animated: true)
            editButton.setTitle("終了する", for: .normal)
        }
        else {
            checkedWordTableView.setEditing(false, animated: true)
            editButton.setTitle("編集する", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        print(checkedWordArray)

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
