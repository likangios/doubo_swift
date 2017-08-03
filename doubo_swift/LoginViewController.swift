//
//  LoginViewController.swift
//  doubo_swift
//
//  Created by macdev on 2017/7/27.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire
import SnapKit
import SwiftyJSON

enum LoginType:Int{
    case QQLogin = 1
    
    case WXLogin
    
    case WBLogin
    
    case MBLogin
}

class LoginViewController: BaseViewController {
    
    lazy var bgimageView:UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    lazy var loginTypeImages:[String] = {
        var array = [String]()
        array.append("login_qq_normal")
        array.append("login_wechat_normal")
        array.append("login_sina_normal")
        array.append("login_iphone_normal")
        return array
    }()
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "ffffff")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "登录逗播"
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        creatSubView()
        let iv = UIImageView()
        view.addSubview(iv)
        iv.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 100, height: 100))
            make.center.equalTo(view)
        }
        iv.image = UIImage.imageWithColor(color: UIColor.orange, WithFrame: CGRect(x: 10, y: 10, width: 30, height: 30))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension LoginViewController {
    func creatSubView() {
        view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-170)
        }
        let width:CGFloat = 68.0
        let height:CGFloat = 68.0
        let space:CGFloat = 5.0
        let sideSize:CGFloat = (kScreenW - width * 4 - space * 3) / 2.0
        
        var lastButton:UIButton?;
        
        for index in 1...loginTypeImages.count {
            let imgName = loginTypeImages[index-1]
            let button:UIButton = UIButton.init(type: .custom)
            button.tag = index
            button.setImage(UIImage.init(named: imgName), for: .normal)
            button.addTarget(self, action: #selector(loginButtonClick(button:)), for: .touchUpInside)
            view.addSubview(button)
            button.snp.makeConstraints({ (make) in
                make.width.equalTo(width)
                make.height.equalTo(height)
                if lastButton != nil {
                    make.left.equalTo(lastButton!.snp.right).offset(space);
                    make.top.equalTo(lastButton!.snp.top)
                }
                else{
                    make.left.equalTo(sideSize);
                    make.top.equalTo(self.titleLabel.snp.bottom).offset(25)
                }
            })
            lastButton = button
        }
}
    func loginButtonClick(button:UIButton) {
        
        switch button.tag {
        case LoginType.QQLogin.rawValue:
            
     
            
//            return
//            let appdelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//            let nav = BaseNavigationViewController.init(rootViewController: HomeTabBarViewController())
//            nav.setNavigationBarHidden(true, animated: true)
//            appdelegate.setRootViewController(vc: nav)
            break
        case LoginType.WXLogin.rawValue:
            
            break
        case LoginType.WBLogin.rawValue:
            
            break
        case LoginType.MBLogin.rawValue:
            let mobil = MobilePhoneViewController()
            navigationController?.pushViewController(mobil, animated: true)
            break
        default:
            break
        }
        
    }
}
