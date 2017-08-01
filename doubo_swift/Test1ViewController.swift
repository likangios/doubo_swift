//
//  Test1ViewController.swift
//  doubo_swift
//
//  Created by macdev on 2017/7/28.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit
import StoreKit

class Test1ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        creatSubView()
        // Do any additional setup after loading the view.
    }
    func creatSubView() {
        let testView = UIView()
        testView.backgroundColor = UIColor.blue
        testView.addLineUp(hasUP: true, andDown: true, andColor: UIColor.red)
        view.addSubview(testView)
        testView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 100, left: 10, bottom: 300, right: 10))
        }
        testView.layoutIfNeeded()
        let corner:UIRectCorner = [UIRectCorner.topLeft,UIRectCorner.topRight]
        testView.clipRectCorner(direction: corner, cornerRadius: 5)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let test2 = Test2ViewController()
//        present(test2, animated: true, completion: {
//            
//        })
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            // Fallback on earlier versions
        }
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
