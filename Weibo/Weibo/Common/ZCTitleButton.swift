//
//  ZCTitleButton.swift
//  Weibo
//
//  Created by LPPZ-User02 on 2016/11/6.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

import UIKit

class ZCTitleButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
     
     override init(frame: CGRect) {
          super.init(frame: frame)
          
          setTitleColor(UIColor.darkText, for: UIControlState.normal)
          setImage(UIImage.init(named: "navigationbar_arrow_down"), for: UIControlState.normal)
          setImage(UIImage.init(named: "navigationbar_arrow_up"), for: UIControlState.selected)
          sizeToFit()
     }
     
     required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
     }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //titleLabel?.frame.insetBy(dx: -(imageView?.bounds.width)!, dy: 0)
        //imageView?.frame.insetBy(dx: (titleLabel?.bounds.width)!, dy: 0)
     //swift 可以直接修改结构体
     titleLabel?.frame.origin.x = 0
     imageView?.frame.origin.x = (titleLabel?.frame.size.width)!
    }

}
