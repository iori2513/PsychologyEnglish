//
//  AccountSettingViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/26.
//

import UIKit
import Firebase

class AccountSettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var accountTableView: UITableView!
    
    //tableViewCellの個数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    //tableViewCellに表示する内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ASTableViewCell", for: indexPath)
        cell.textLabel!.text = "退会する"
        let label: UILabel = cell.contentView.subviews[0] as! UILabel
        label.textColor = UIColor.red
        return cell
    }
    
    //セル選択時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            deleteAlert()
        }
    }
    
    //削除するかどうかをユーザーに問うアラートを表示
    func deleteAlert() {
        let deleteAlert: UIAlertController = UIAlertController(title: "アカウント削除", message: "削除してもよろしいですか？", preferredStyle:  UIAlertController.Style.alert)
        let deleteAction: UIAlertAction = UIAlertAction(title: "削除する", style: UIAlertAction.Style.destructive, handler:{
                (action: UIAlertAction!) -> Void in
                self.deleteAccount()
            })
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
                (action: UIAlertAction!) -> Void in
            // TableViewCellの選択を解除する
            self.accountTableView.deselectRow(at: IndexPath(row: 0, section: 0), animated: false)
            //アラートを閉じる
            deleteAlert.dismiss(animated: true, completion: nil)
            })
        
        deleteAlert.addAction(deleteAction)
        deleteAlert.addAction(cancelAction)
        
        self.present(deleteAlert, animated: true, completion: nil)
    }
    
    //アカウント削除
    func deleteAccount() {
        Auth.auth().currentUser?.delete() { [weak self] error in
               guard let self = self else { return }
               if error == nil {
                   print(1)
                   self.removeUserDefaults()
                   self.confirmAlert()
               }
               self.showErrorIfNeeded(error)
        }
    }
    
    //Userdefaultsのデータを削除
    func removeUserDefaults() {
        let appDomain = Bundle.main.bundleIdentifier
        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
    }
    
    //確認のアラート表示
    func confirmAlert() {
        let confirmAlert = UIAlertController(title: "確認", message: "退会しました", preferredStyle: .alert)
        confirmAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            self.goToInitialView()
        }))
        self.present(confirmAlert, animated: true, completion: nil)
    }
    
    // エラー表示
    private func showErrorIfNeeded(_ errorOrNil: Error?) {
        // エラーがなければ何もしません
        guard let error = errorOrNil else { return }

        let message = "エラーが起きました"
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    //トップの画面に戻る
    func goToInitialView() {
        let layer_number = navigationController!.viewControllers.count
        self.navigationController?.popToViewController(navigationController!.viewControllers[layer_number-4], animated: true)
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
