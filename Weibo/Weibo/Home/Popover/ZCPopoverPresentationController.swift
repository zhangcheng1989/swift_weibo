//
//  ZCPopoverPresentationController.swift
//  Weibo
//
//  Created by LPPZ-User02 on 2016/11/7.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

import UIKit

class ZCPopoverPresentationController: UIPresentationController {

    
    var presentFrame = CGRect.zero
    
    /// 初始化方法，用于创建负责转场动画的对象
    ///
    /// - Parameters:
    ///   - presentedViewController: 被展现的控制器
    ///   - presentingViewController: 发起的控制器 xcode6是nil xcode7是野指针
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    
    /// 即将布局转场子视图时调用
    override func containerViewWillLayoutSubviews()
    {
//        containerView  //容器视图
//        presentedView //被展现的视图
        if  presentFrame == CGRect.zero
        {
            presentedView?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
        }else
        {
            presentedView?.frame = presentFrame
        }
        
        
        containerView?.insertSubview(coverView, at: 0)
    }
    
    //MARK: --懒加载
    private lazy var coverView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.main.bounds
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeView))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    func  closeView() {
//        presentedViewController 拿到当前弹出的控制器
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
