//
//  SettingViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/25.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //tableViewCellの個数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    //tableViewCellに表示する内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "settingTableCell", for: indexPath)
        let settingArray: [String] = ["アカウント設定", "復習用単語を閲覧する"]
        cell.textLabel!.text = settingArray[indexPath.row]
        return cell
    }
    
    //セル選択時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "account", sender: nil)
        }
        if indexPath.row == 1 {
            performSegue(withIdentifier: "myWords", sender: nil)
        }
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
