//
//  LoginAPI.swift
//  doubo_swift
//
//  Created by macdev on 2017/8/2.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit
import Alamofire

let getCodeUrl = "/account/mobile/send"
let loginUrl = "/login/mobile_code"
// http://api.test.doubo.tv:80/account/mobile/send?type=1&user_phone=13675158507
class LoginAPI: NSObject {
    class func requestGetPhoneCode(phone:String,finished:@escaping(_ result : AnyObject?,_ error :NSError?)->()) {
        let requestUrl:String = HostName + ":" + HostPort + getCodeUrl + "?" + "type=1&user_phone=\(phone)"
        NetworkTools.shareInstance.requestData(requestUrl, httpMethod: .get, parameters: nil) { (result, error) in
            finished(result,error)
        }
    }
    class func requestLoginApp(user_phone:String,code:String,finished:@escaping(_ result:AnyObject?,_ error : NSError?)->()) {
        guard code.isEmpty != true else {
            return
        }
        let requestUrl:String = HostName + ":" + HostPort + loginUrl + "?" + "code=\(code)&user_phone=\(user_phone)"
        NetworkTools.shareInstance.requestData(requestUrl, httpMethod: .get, parameters: nil) { (result, error) in
            finished(result,error)
        }
    }
    
}
