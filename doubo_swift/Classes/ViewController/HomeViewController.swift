//
//  HomeViewController.swift
//  doubo_swift
//
//  Created by macdev on 2017/8/1.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
       self.navigationItem.title = "首页"
        creatSubView()
    }
    func creatSubView() {
        let testView = UIView()
        testView.backgroundColor = UIColor.blue
        testView.addLineUp(hasUP: true, andDown: true)
        view.addSubview(testView)
        testView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 100, left: 10, bottom: 300, right: 10))
        }
        
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
