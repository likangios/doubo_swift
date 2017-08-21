//
//  MobilePhoneViewController.swift
//  doubo_swift
//
//  Created by macdev on 2017/8/2.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit
import SwiftyJSON
import MBProgressHUD

class MobilePhoneViewController: BaseViewController {
    
    lazy var phontTextFiled:UITextField = {
       let field = UITextField()
        field.placeholder = NSLocalizedString("请输入手机号", comment: "nil")
        field.textColor = UIColor.blue.withAlphaComponent(0.4)
        field.keyboardType = UIKeyboardType.numberPad
        field.borderStyle = UITextBorderStyle.bezel
        return field
    }()
    lazy var codeTextField:UITextField = {
       let field = UITextField()
        field.placeholder = NSLocalizedString("请输入验证码", comment: "nil")
        field.keyboardType = UIKeyboardType.numberPad
        field.textColor = UIColor.green.withAlphaComponent(0.4)
        field.borderStyle = UITextBorderStyle.bezel
        return field
    }()
    lazy var sendCodeButton:UIButton = {
       let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle(NSLocalizedString("发送验证码", comment: "nil"), for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.backgroundColor = UIColor.orange.withAlphaComponent(0.7)
        btn.layer.cornerRadius = 5.0
        btn.addTarget(self, action: #selector(getPhoneCode), for: UIControlEvents.touchUpInside)
        return btn
    }()
    lazy var loginButton:UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle(NSLocalizedString("登录", comment: "nil"), for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
        btn.layer.cornerRadius = 5.0
        btn.addTarget(self, action: #selector(loginClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        creatSubView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension MobilePhoneViewController {
    func creatSubView() {
        view.addSubview(self.phontTextFiled)
        view.addSubview(self.codeTextField)
        view.addSubview(self.sendCodeButton)
        view.addSubview(self.loginButton)
        self.phontTextFiled.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(40)
            make.height.equalTo(40)
        }
        self.codeTextField.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(self.phontTextFiled.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        self.sendCodeButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.codeTextField.snp.right)
            make.top.equalTo(self.codeTextField.snp.bottom).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        self.loginButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(self.sendCodeButton.snp.bottom).offset(40)
            make.height.equalTo(40)
        }
    }
    func getPhoneCode() {
        LoginAPI.requestGetPhoneCode(phone: self.phontTextFiled.text!, finished: { (result, error) in
            print("result:\(String(describing: result)) \n error:\(error)")
            let json = JSON(result)
            print("json is \(json)")
            let mb = MBProgressHUD()
            mb.labelText = json["msg"] as! String
            mb.mode = MBProgressHUDMode.text
            mb.hide(animated: true, afterDelay: 3)
            
        })
    }
    func loginClick() {
        LoginAPI.requestLoginApp(user_phone: self.phontTextFiled.text!, code: self.codeTextField.text!, finished: { (result, error) in
            print("result:\(String(describing: result)) error:\(error)")
            let json = JSON(result)
            print(json)
        })
        
    }
    
}
