//
//  Home_2_ViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/11.
//

import UIKit

class Home_2_ViewController: UIViewController {

    @IBOutlet weak var wordCount: UILabel!
    @IBOutlet weak var mainWord: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    
    var number :Int = 1
    
    
    @IBAction func goToNextWordAction(_ sender: Any) {
        number += 1
        wordCount.text = "No." + String(number)
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
