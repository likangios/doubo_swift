//
//  NetworkTools.swift
//  doubo_swift
//
//  Created by macdev on 2017/8/2.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit
import Alamofire

class NetworkTools: NSObject {
    
    static let shareInstance:NetworkTools = {
        return NetworkTools()
    }()
    
    
    
}
extension NetworkTools {
    
  public  func requestData(_ url:String ,httpMethod:HTTPMethod,parameters:Parameters?,_ finished: @escaping (_ result:AnyObject?,_ error:NSError?)->()) {
    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let bundleName:String = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as! String
    let bundleVersion:String = Bundle.main.object(forInfoDictionaryKey: kCFBundleInfoDictionaryVersionKey as String) as! String
    let model:String = UIDevice.current.model
    let systemName:String = UIDevice.current.systemName
    let scale:String = "\(UIScreen.main.scale)"
    
    let userAgent = bundleName + bundleVersion + model + systemName 
        + scale
    
        var   headers:HTTPHeaders = ["version":version]
        headers["devType"] = "iPhone"
        headers["rate"] = "\(UIScreen.main.scale * UIScreen.main.bounds.size.height)X\(UIScreen.main.scale * UIScreen.main.bounds.size.width)"
//        headers["networkType"] = 网络状态
        headers["devId"] = UIDevice.current.identifierForVendor?.uuidString
        headers["channel"] = "App Store"
        headers["versionCode"] = UIDevice.current.localizedModel
        headers["pflag"] = "1"
        headers["sourceType"] = "client"
        headers["User-Agent"] = "DOUBO/2.9.0(iPhone;iOS 10.1.1;iPhone7,1;Scale/3.00)"
        headers["idfa"] = "none"
    
        Alamofire.request(url, method: httpMethod, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON() { (response) in
            switch response.result {
            case .success(let value):
                print(" parameters success--value:\(value)")
                finished(value as AnyObject,nil)
                break
            case .failure(let error):
                print("parameters failure==error:\(error)")
                finished(nil,error as NSError)
                break
            }
            
        }
    }
}
