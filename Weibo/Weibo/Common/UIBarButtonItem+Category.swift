//
//  UIBarButtonItem+Category.swift
//  Weibo
//
//  Created by LPPZ-User02 on 2016/11/6.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

import UIKit
extension UIBarButtonItem{
    class func createBarButtonItem(imageName:String,target: Any?, action: Selector)->UIBarButtonItem
    {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(UIImage.init(named: imageName), for: UIControlState.normal)
        btn.setImage(UIImage.init(named: imageName+"_highlighted"), for: UIControlState.highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        return  UIBarButtonItem(customView: btn)
    }
}
