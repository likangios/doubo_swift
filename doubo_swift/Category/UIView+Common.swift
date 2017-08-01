//
//  UIView+Common.swift
//  doubo_swift
//
//  Created by macdev on 2017/8/1.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit

let kColorDDD = UIColor.init(hexString: "dddddd")

extension UIView {
    
    func addLineUp(hasUP:Bool,andDown hasDown:Bool){
        
        addLineUp(hasUP: hasUP, andDown: hasDown, andColor: kColorDDD!)
    }
    func addLineUp(hasUP:Bool,andDown hasDown:Bool,andColor color:UIColor){
        addLineUp(hasUP: hasUP, andDown: hasDown, andColor: color, andLeftSpace: 0)
    }
    func addLineUp(hasUP:Bool,andDown hasDown:Bool,andColor color:UIColor ,andLeftSpace leftSpace:CGFloat){
        
        if hasUP {
            let line:UIView = lineView(withColor: color)
            addSubview(line)
            line.snp.makeConstraints({ (make) in
               make.left.equalTo(leftSpace)
                make.right.equalTo(-leftSpace)
                make.top.equalTo(0)
                make.height.equalTo(1)
            })
            
        }
        if hasDown {
            let line:UIView = lineView(withColor: color)
            addSubview(line)
            line.snp.makeConstraints({ (make) in
                make.left.equalTo(leftSpace)
                make.right.equalTo(-leftSpace)
                make.bottom.equalTo(0)
                make.height.equalTo(1)
            })
 
        }
        
    }
    func lineView(withColor color:UIColor) -> UIView {
        let lineView = UIView()
        lineView.backgroundColor = color
        return lineView
    }
    
}
