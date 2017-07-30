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
        view.backgroundColor = UIColor.gray

        // Do any additional setup after loading the view.
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
       SKStoreReviewController.requestReview()
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
