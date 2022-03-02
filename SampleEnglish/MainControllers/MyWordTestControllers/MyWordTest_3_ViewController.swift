//
//  Second_2_ViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/25.
//

import UIKit

class MyWordTest_3_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var checkedWordTableView: UITableView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    var cellNumber: Int = 0  //tableViewCellの個数を表す変数で値はMyWordTest_2_ViewControllerから引き継いでくる
    var switchArray :[Int] = []  //MyWordTest_2_ViewControllerのswitchArrayを引き継ぐための配列
    var checkedWordArray :[String] = []  //checkをつけた単語のデータを入れる配列で値はMyWordTest_2_ViewControllerから引き継いでくる
    var userWordArray :[String] = []  //ユーザーのわからなかった単語をこの配列に入れてUserdefaultsに保存する
    
    
    //tableViewCellの個数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkedWordArray.count
    }
    
    //tableViewCellに表示する内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "checkedWordCell", for: indexPath)
        let cellCheckedWordArray = checkedWordArray[indexPath.row].components(separatedBy: ",")
        cell.textLabel!.text = cellCheckedWordArray[0] + "・・・" + cellCheckedWordArray[1]
        return cell
    }
    
    
    //編集ボタンを押したときの処理
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
    
    //tableViewCellを削除する処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            checkedWordArray.remove(at: indexPath.row)
            checkedWordTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    //削除ボタンを押した際の処理
    @IBAction func pushDeleteButton(_ sender: Any) {
        var userData = UserData().wordArray
        for word in checkedWordArray {
            for data in userData {
                if word == data {
                    userData.removeAll(where: {$0 == "\(word)"})
                }
            }
        }
        UserData().wordArray = userData
        confirmAlert()
    }
    
    //確認のアラート表示
    func confirmAlert() {
        let confirmAlert = UIAlertController(title: "確認", message: "削除しました", preferredStyle: .alert)
        confirmAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            self.deleteButton.isSelected = false
        }))
        self.present(confirmAlert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(checkedWordArray)
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
