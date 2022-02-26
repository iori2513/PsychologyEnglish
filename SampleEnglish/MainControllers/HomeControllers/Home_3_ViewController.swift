//
//  Home_3_ViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/16.
//

import UIKit

class Home_3_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var checkedWordTableView: UITableView!
    
    var cellNumber: Int = 0  //tableViewCellの個数を表す変数で値はHome_2_ViewControllerから引き継いでくる
    var switchArray :[Int] = []  //Home_2_ViewControllerのswitchArrayを引き継ぐための配列
    var checkedWordArray :[String] = []  //checkをつけた単語のデータを入れる配列で値はHome_2_ViewControllerから引き継いでくる
    var userWordArray :[String] = []  //ユーザーのわからなかった単語をこの配列に入れてUserdefaultsに保存する
    var cellCheckedWordArray :[String] = []
    
    
    //tableViewCellの個数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return switchArray.count
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
            cellCheckedWordArray.remove(at: indexPath.row)
            switchArray.remove(at: indexPath.row)
            checkedWordTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            print(cellCheckedWordArray)
        }        
    }
    
    
    //復習用単語に保存ボタンを押した際の処理
    @IBAction func saveCheckedWordButton(_ sender: Any) {
        //現在のユーザーの復習用単語のデータを参照し、今回のテストでわからなかった単語と被りがないように保存する
        userWordArray = UserData().wordArray
        for data in checkedWordArray {
            for userData in userWordArray {
                if data == userData {
                    break
                }
            }
            userWordArray += [data]
        }
        UserData().wordArray = userWordArray
        print(UserData().wordArray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        print(checkedWordArray)
        print(UserData().wordArray)
        checkedWordTableView.isEditing = true

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
