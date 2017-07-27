//
//  ViewController.swift
//  doubo_swift
//
//  Created by macdev on 2017/7/4.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    lazy var testView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        self.view.addSubview(view)
        view.snp.makeConstraints({ (make) in
            make.center.equalTo(self.view)
            make.width.height.equalTo(200)
        })
        let gradlayer = CAGradientLayer()
            gradlayer.colors = [UIColor.clear,UIColor.red,UIColor.clear]
            gradlayer.position = CGPoint(x: 20, y: 100);
            gradlayer.startPoint = CGPoint(x: 20, y: 100);
            gradlayer.endPoint = CGPoint(x: 40, y: 100);
        view.layer.mask = gradlayer
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        testView.backgroundColor = UIColor.gray
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.frame = CGRect(x: 0, y: 0, width: 100, height: 40);
        gradient.opacity = 1
        gradient.colors = [UIColor.clear.cgColor,UIColor.clear.cgColor]
        testView.layer .insertSublayer(gradient, at: 0)
        self.view.addSubview(testView)
        
        
        
        
        let textField = UITextField()
        textField.placeholder = "placeholder"
        view.addSubview(textField)
        
        textField.snp.makeConstraints { (make) in
            make.left.right.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        let textField2 = UITextField()
        textField2.placeholder = "placeholder2"
        view.addSubview(textField2)
        
        textField2.snp.makeConstraints { (make) in
            make.left.right.equalTo(20)
            make.top.equalTo(textField.snp.bottom).offset(10)
        }
        textField2.becomeFirstResponder()
        
        let notificationName = Notification.init(name: .UIKeyboardWillShow)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: notificationName.name, object: textField2)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view .endEditing(true)
    }
    
    func keyboardWillShow(notification:Notification) {
     
        print(notification.object ?? notification)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

