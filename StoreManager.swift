//
//  StoreManager.swift
//  doubo_swift
//
//  Created by macdev on 2017/8/21.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit

class StoreManager: NSObject {
    
    static let shareInstance:StoreManager = {
        let store = StoreManager()
        return store
    }()
    
    func saveKeychainitem(secrect:String!,attribute:String! = "password",service:String = "com.alix.keychain") {
        var query:[String:AnyObject] = [String:AnyObject]()
        query[NSString.init(format: kSecClass) as String] = NSString(format: kSecClassGenericPassword) as AnyObject
        query[NSString.init(format: kSecAttrService) as String] = service as AnyObject
        query[NSString.init(format: kSecAttrAccount) as String] = attribute as AnyObject
        query[NSString.init(format: kSecValueData) as String] = secrect.data(using: .utf8) as AnyObject
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }
    func loadKeychainItem(attribute:String = "password",service:String = "com.alix.keychain") -> String? {
        var query = Dictionary<String,AnyObject>()
        query[NSString.init(format: kSecClass) as String] = NSString(format: kSecClassGenericPassword) as AnyObject
        query[NSString.init(format: kSecAttrService) as String] = service as AnyObject
        query[NSString.init(format: kSecAttrAccount) as String] = attribute as AnyObject
        query[NSString.init(format: kSecMatchLimit) as String] = kSecMatchLimitOne as AnyObject
        query[NSString.init(format: kSecReturnData) as String] = kCFBooleanTrue as AnyObject
        
        var dataTypeRef: Unmanaged<AnyObject>?
        SecItemCopyMatching(query as CFDictionary, dataTypeRef as CFTypeRef)
        var contentsOfKeychain:String?
        if let op = dataTypeRef?.toOpaque() {
            let retrieveData = Unmanaged<NSData>.fromOpaque(op).takeUnretainedValue()
            contentsOfKeychain = NSString.init(data: retrieveData as Data, encoding: .utf8)
        }
        
    }
    
    
}
