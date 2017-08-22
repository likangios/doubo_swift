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
        context.setFillColor(color.cgColor)
        context.fill(frame)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
   class func imageWithColor(color: UIColor) -> UIImage? {
    return self .imageWithColor(color: color, WithFrame: CGRect(x: 0, y: 0, width: 1, height: 1))
    }
    func scaledToSize(targetSize:CGSize) -> UIImage {
        let sourceImage:UIImage = self
        var newImage:UIImage?
        let sourceSize = sourceImage.size
        var  scaleFactor:CGFloat = 1.0
        if __CGSizeEqualToSize(sourceSize, targetSize) != true {
            let widthFactor = targetSize.width / sourceSize.width
            let heightFactor = targetSize.height / sourceSize.height
            
            if widthFactor > heightFactor {
                scaleFactor = widthFactor
            }
            else{
                scaleFactor = heightFactor
            }
        }
        let newSize = CGSize(width: sourceSize.width * scaleFactor, height: sourceSize.height * scaleFactor)
        UIGraphicsBeginImageContext(newSize)
        sourceImage.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        newImage = UIGraphicsGetImageFromCurrentImageContext()
    return newImage!
        
    }
}
