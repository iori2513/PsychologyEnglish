//
//  TabBarController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/01/16.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()

        // Do any additional setup after loading the view.
    }
    
    // タブバーを実装する
    func setTabBar() {
        let homeViewController = HomeViewController()
        let secondViewController = SecondViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        homeViewController.view.backgroundColor = .white
        secondViewController.tabBarItem = UITabBarItem(title: "second", image: .none, tag: 0)
        secondViewController.view.backgroundColor = .white
        
        viewControllers = [homeViewController, secondViewController]
        setViewControllers(viewControllers, animated: true)
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
