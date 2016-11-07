//
//  ZCPopoverAnimator.swift
//  Weibo
//
//  Created by LPPZ-User02 on 2016/11/7.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

import UIKit

class ZCPopoverAnimator: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning
{
    ///记录当前是否展开
    var isPrsent:Bool = false
    ///菜单大小
    var presentFrame = CGRect.zero
    
    //MARK: --UIViewControllerTransitioningDelegate
    //UIPresentationController iOS8推出专门负责用于转场动画的
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
    {
        
        let pc = ZCPopoverPresentationController(presentedViewController: presented, presenting: presenting)
        //设置菜单大小
        pc.presentFrame = presentFrame
        return pc
    }
    
    //MARK: --UIViewControllerAnimatedTransitioning，只要实现了以下方法，那么系统自带的默认动画就没有了，所有的东西都需要自己实现
    /// 负责modal的展现动画
    ///
    /// - Parameters:
    ///   - presented: 被展现的视图
    ///   - presenting: 发起的视图
    /// - Returns: 谁来负责
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPrsent = true
        return self
    }
    
    
    /// 负责modal的消失动画
    ///
    /// - Parameter dismissed: 被关闭的视图
    /// - Returns: 谁来负责
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPrsent = false
        return self
    }
    
    
    ///返回动画时长
    ///
    /// - Parameter transitionContext: 上下文，里面保存了动画需要的所有参数
    /// - Returns: 动画时长
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    {
        return 0.5
    }
    
    
    /// 告诉系统如何动画，无论是展现还是消失都会调用这个方法
    ///
    /// - Parameter transitionContext: 上下文，里面保存了动画需要的所有参数
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        
        if isPrsent
        {
            //获取展现视图
            //        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
            //        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            toView?.transform =  CGAffineTransform.init(scaleX: 1.0, y: 0.0)
            
            //注意：一定要将试图添加到容器上
            transitionContext.containerView.addSubview(toView!)
            
            //设置锚点
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            //执行动画
            UIView.animate(withDuration: 0.5, animations: { 
                toView?.transform = CGAffineTransform.identity
            }, completion: { (_) in
                //如果不写，可能出现未知的错误
                transitionContext.completeTransition(true) //表示动画执行完毕

            })
            
        }else
        {
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            //注意：由于CGFloat是不准确，所以写0.0就没有动画
            UIView.animate(withDuration: 0.5, animations: {
                fromView?.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.0000001)
            }, completion: { (_) in
                transitionContext.completeTransition(true) //表示动画执行完毕
            })
        }
        
        
    }
    
    
}
