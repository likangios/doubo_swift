//
//  UIImage+Common.swift
//  doubo_swift
//
//  Created by 哈哈哈 on 2017/8/3.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit

class UIImage_Common: NSObject {

}
extension UIImage {
    class func imageWithColor(color:UIColor,WithFrame frame:CGRect) -> UIImage {
        UIGraphicsBeginImageContext(frame.size)
        let context:CGContext =  UIGraphicsGetCurrentContext()!
        context.fill(frame)
        context.setFillColor(color.cgColor)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
