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
        self.tabBar.isHidden = true
        view.backgroundColor = UIColor.green
        setSubViewController(viewcontrollers: self.vs)
        
        let tabbarView:HomeTabBarView = HomeTabBarView()
        self.view.addSubview(tabbarView)
        tabbarView.snp.makeConstraints { (make) in
            make.right.left.bottom.equalTo(0)
            make.height.equalTo(49)
        }
        tabbarView.shouldReloadDataClosure {(item:UIButton?) in
            switch item?.tag {
            case let tag where tag == 1:
                
                break
            case let tag where tag == 3:
                break
            default:
                break
            }
        }
        tabbarView.clickValueClosure { (item:UIButton?) in
            switch item?.tag {
            case let tag where tag == 1:
                self.selectedIndex = 0
                break
            case let tag where tag == 2:
                break
            case let tag where tag == 3:
                self.selectedIndex = 1
                break
            default:
                break
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension HomeTabBarViewController {
    func setSubViewController(viewcontrollers:[UIViewController]) {
        self.viewControllers = viewcontrollers
    }
}
