//
//  Common.swift
//  doubo_swift
//
//  Created by macdev on 2017/7/27.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage
import Alamofire

// 当前系统版本
let kCersion = (UIDevice.current.systemVersion as NSString).floatValue
// 屏幕宽度
let kScreenH = UIScreen.main.bounds.height
// 屏幕高度
let kScreenW = UIScreen.main.bounds.width

let HostName:String = "http://api.test.doubo.tv"
let HostPort:String = "80"
let Access_Key = "doubo_user_key"
let Access_Secret = "doubo_user_secret"
let Signature = "signature"
