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
    var csvArray :[String] = []  //Home_2_ViewControllerのcsvArrayを引き継ぐための配列
    var checkedWordArray :[String] = []  //checkをつけた単語のデータを入れる配列
    
    
    //checkedWordArrayにチェックされた単語を代入する
    func putWordInCheckedWordArray() {
        for num in switchArray {
            checkedWordArray += [csvArray[num]]
        }
        
    }
    
    //tableViewCellの個数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return switchArray.count
    }
    
    //tableViewCellに表示する内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "checkedWordCell", for: indexPath)
        putWordInCheckedWordArray()
        let cellCheckedWordArray = checkedWordArray[indexPath.row].components(separatedBy: ",")
        cell.textLabel!.text = cellCheckedWordArray[0] + "・・・" + cellCheckedWordArray[1]
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)

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
