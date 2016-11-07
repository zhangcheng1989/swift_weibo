
//
//  ZCVisitorView.swift
//  Weibo
//
//  Created by LPPZ-User02 on 2016/11/4.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

import UIKit

protocol ZCVisitorViewDelegate:NSObjectProtocol {
    func registerBtnWillClick()
    func loginClickBtnWill()
}

class ZCVisitorView: UIView {
    
    @IBOutlet weak var img_smallicon: UIImageView!
    @IBOutlet weak var lb_message: UILabel!
    @IBOutlet weak var img_house: UIImageView!
    
    weak var delegate:ZCVisitorViewDelegate?
 
    /**
    override init(frame: CGRect) {
        super.init(frame: frame)
        //addSubview(iconView)
        //addSubview(homeIcon)
        //addSubview(messageLabel)
        //addSubview(loginBtn)
        //addSubview(registerBtn)
     
    }**/
    
    //swift推荐我们自定义一个控件，要么用纯代码，要么用xib/stroyboard
//    required init?(coder aDecoder: NSCoder) {
//        //如果通过xib/stroyboard创建该类，就会崩溃
//        fatalError("init(coder:) has not been implemented")
//    }

    //约束公式："那个控件" 的 "什么属性" "等于" "另外一个控件" 的 "什么属性" 乘以 "多少" 加上 "多少"
    func getXib() -> UIView
    {
        return Bundle.main.loadNibNamed("ZCVisitorView", owner: nil, options: nil)?.last as! UIView
    }
    
    //setUpVisitorInfo(isHome:Bool,imageName:String, message:String)
    func setUpVisitorInfo(isHome:Bool,imageName:String, message:String)
    {
        startAnimation()
    }
    
    
    private func startAnimation()
    {
        let anim = CABasicAnimation(keyPath: "transform.ratation")
        anim.toValue = 2 * M_PI
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        anim.isRemovedOnCompletion = false
//        img_smallicon.layer.add(anim, forKey: nil)
    }



    /***
    //MARK: --懒加载控件
    private lazy var iconView:UIImageView = {
       let iv = UIImageView(image: UIImage.init(named: "visitordiscover_feed_image_smallicon"))
        return iv
    }()
 
    private lazy var homeIcon:UIImageView = {
        let iv = UIImageView(image: UIImage.init(named: "visitordiscover_feed_image_house"))
        return iv
    }()
    
    private lazy var messageLabel:UILabel = {
        let label = UILabel()
        label.text = "测试测试测试测试测试测试测试"
        return label
    }()
    
    private lazy var loginBtn:UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("登录", for: UIControlState.normal)
        btn.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), for: UIControlState.normal)
        return btn
    }()
    
    private lazy var registerBtn:UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("注册", for: UIControlState.normal)
        btn.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), for: UIControlState.normal)
        return btn
    }()**/
    @IBAction func registerClick(_ sender: Any) {
        delegate?.registerBtnWillClick()
    }
    
    @IBAction func loginClick(_ sender: Any) {
        delegate?.loginClickBtnWill()
    }
    
}
