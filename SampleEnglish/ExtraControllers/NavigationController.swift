//
//  NavigationController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/01/18.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()

        // Do any additional setup after loading the view.
    }
    
    func hideNavigationBar() {
        let homeViewController = HomeViewController()
        homeViewController.navigationController?.setNavigationBarHidden(true, animated: true)
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
