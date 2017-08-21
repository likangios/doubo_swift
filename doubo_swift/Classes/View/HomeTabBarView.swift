//
//  HomeTabBarView.swift
//  doubo_swift
//
//  Created by macdev on 2017/8/21.
//  Copyright © 2017年 jimo. All rights reserved.
//

import UIKit

class HomeTabBarView: UIView {
    
    typealias clickItemClosure = (_ item:UIButton?) -> Void
    
    var clickClosure:clickItemClosure?
    var reloadDataClosure:clickItemClosure?
    
    
    public func clickValueClosure(closure:clickItemClosure?) {
        clickClosure = closure
    }
    public func shouldReloadDataClosure(closure:clickItemClosure?) {
        reloadDataClosure = closure
    }
    
    lazy var normalImags:[UIImage] = {
        var arr:Array = [UIImage]()
        arr.append(UIImage.init(named: "home")!)
        arr.append(UIImage.init(named: "live_Image")!)
        arr.append(UIImage.init(named: "mine")!)
        return arr
    }()
    lazy var selectImags:[UIImage] = {
        var arr:Array = [UIImage]()
        arr .append(UIImage.init(named: "home_selected")!)
        arr .append(UIImage.init(named: "live_Image")!)
        arr .append(UIImage.init(named: "mine_selected")!)
        return arr
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addLineUp(hasUP: true, andDown: false)
        creatSubVie()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func creatSubVie() {
        
        let sideSize:CGFloat = 10.0
        let tabBarWidth:CGFloat = (kScreenW - sideSize * 2) / CGFloat(self.normalImags.count)
        var lastItem:UIButton? = nil
        
        for index  in 1...self.normalImags.count {
            let nImg = self.normalImags[index-1]
            let sImg = self.selectImags[index-1]
            
            let button = UIButton.init(type: .custom)
            button.setImage(nImg, for: .normal)
            button.setImage(sImg, for: .selected)
            button.tag = index
            addSubview(button)
            button.snp.makeConstraints({(make) in
                make.width.equalTo(tabBarWidth)
                if(lastItem != nil){
                    make.left.equalTo(lastItem!.snp.right);
                }
                else {
                    make.left.equalTo(10)
                }
                if index == 2 {
                    make.centerY.equalTo(self).offset(-20)
                }
                else{
                    make.centerY.equalTo(self).offset(0)
                }
            })
            if index == 1{
                button.isSelected = true
            }
            button.addTarget(self, action: #selector(itemClick(item:)), for: .touchUpInside)
            lastItem = button
        }
        
        
    }
    func itemClick(item:UIButton) {
        if item.isSelected == true {
            if reloadDataClosure != nil {
                reloadDataClosure!(item)
            }
            return
        }
        if clickClosure != nil {
            clickClosure!(item)
        }
        guard item.tag != 2 else {
            return
        }
        for index in 1...self.normalImags.count {
            let button:UIButton = viewWithTag(index) as! UIButton
            button.isSelected = false
        }
        item.isSelected = true
        
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}



