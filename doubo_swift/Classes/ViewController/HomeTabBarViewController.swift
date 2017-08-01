//
//  HomeTabBarViewController.swift
//  doubo_swift
//
//  Created by macdev on 2017/8/1.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit

class HomeTabBarViewController: BaseTabBarViewController {

    lazy var vs:[BaseNavigationViewController] = {
        var arr:[BaseNavigationViewController] = [BaseNavigationViewController]()
      let homeVc =  BaseNavigationViewController.init(rootViewController: HomeViewController())
        let item = UITabBarItem.init(title: nil, image: UIImage.init(named: "home"), selectedImage: UIImage.init(named: "home_selected"))
        homeVc.tabBarItem = item
        homeVc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
        
        
        let userCenterVc =  BaseNavigationViewController.init(rootViewController: UserCenterViewController())
        let item2 = UITabBarItem.init(title: nil, image: UIImage.init(named: "mine"), selectedImage: UIImage.init(named: "mine_selected"))
        userCenterVc.tabBarItem = item2
        userCenterVc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
        arr.append(homeVc)
        arr.append(userCenterVc)
        return arr
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        setSubViewController(viewcontrollers: self.vs)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeTabBarViewController {
    func setSubViewController(viewcontrollers:[UIViewController]) {
        self.viewControllers = viewcontrollers
    }
}
