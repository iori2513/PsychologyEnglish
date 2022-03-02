//
//  MyWordViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/03/01.
//

import UIKit

class MyWordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myWordTableView: UITableView!
    @IBOutlet weak var editButton: UIButton!
    
    
    var myWordArray: [String] = []  //Userdefaultsから単語帳に保存しているデータを取得するための配列
    
    func getData() {
        myWordArray = UserData().wordArray
    }
    //tableViewCellの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myWordArray.count
    }
    
    //tableViewCellの内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myWordCell", for: indexPath)
        var wordDataArray: [String] = []
        wordDataArray = myWordArray[indexPath.row].components(separatedBy: ",")
        cell.textLabel!.text = wordDataArray[0] + "・・・" + wordDataArray[1]
        return cell
    }
    
    //tableViewCellを削除する処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myWordArray.remove(at: indexPath.row)
            UserData().wordArray = myWordArray
            myWordTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    @IBAction func pushEditButton(_ sender: Any) {
        if myWordTableView.isEditing == false {
            myWordTableView.setEditing(true, animated: true)
            editButton.setTitle("終了する", for: .normal)
        }
        else {
            myWordTableView.setEditing(false, animated: true)
            editButton.setTitle("編集する", for: .normal)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //ナビゲーションバーを表示する
        navigationController?.setNavigationBarHidden(false, animated: true)
        getData()
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
