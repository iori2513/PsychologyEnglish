//
//  Home_3_ViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/16.
//

import UIKit

class Home_3_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var checkedWordTableView: UITableView!
    
    var cellNumber: Int = 0
    
    
    //tableViewCellの個数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNumber
    }
    
    //tableViewCellに表示する内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "checkedWordCell", for: indexPath)
        
        cell.textLabel!.text = ""
        return cell
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
