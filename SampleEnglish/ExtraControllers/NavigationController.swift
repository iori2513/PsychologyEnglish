//
//  NavigationController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/01/18.
//

import UIKit

class NavigationController: UIViewController, UINavigationBarDelegate {
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
            return .topAttached
        }
//    func position(for bar: UIBarPositioning) -> UIBarPosition {
//            return .topAttached
//        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
