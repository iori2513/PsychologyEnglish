//
//  SettingViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/25.
//

import UIKit
import Accounts

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let settingArray: [String] = ["My単語帳を見る", "共有"]
    
    //tableViewCellの個数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingArray.count
    }

    //tableViewCellに表示する内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "settingTableCell", for: indexPath)
        cell.textLabel!.text = settingArray[indexPath.row]
        return cell
    }
    
    //セル選択時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "myWords", sender: nil)
        }
        if indexPath.row == 1 {
            shareApp()
        }
    }
    
    //共有画面を表示する
    func shareApp() {
        let shareText = "English Training"
        let shareWebsite = NSURL(string: "https://apps.apple.com/jp/app/englishtraining/id1618582567")!
        let shareImage = UIImage(named: "icon")
        let activityItems = [shareText, shareWebsite, shareImage] as [Any]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)

        let excludedActivityTypes = [
        UIActivity.ActivityType.postToFacebook,
        UIActivity.ActivityType.postToTwitter,
        UIActivity.ActivityType.message,
        UIActivity.ActivityType.saveToCameraRoll,
        UIActivity.ActivityType.print
        ]

        activityVC.excludedActivityTypes = excludedActivityTypes
        self.present(activityVC, animated: true, completion: nil)
        //tableViewの選択状態を元に戻す
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //ナビゲーションバーを非表示にする
        navigationController?.setNavigationBarHidden(true, animated: false)

        //選択済みのtableViewCellの選択状態を元に戻す
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
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
