//
//  ZCQRCodeViewController.swift
//  Weibo
//
//  Created by LPPZ-User02 on 2016/11/7.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

import UIKit

class ZCQRCodeViewController: UIViewController,UITabBarDelegate {

    ///底部视图
    @IBOutlet weak var cusomTabBar: UITabBar!
    ///冲击波视图
    @IBOutlet weak var scanLineView: UIImageView!
    ///扫描容器高度约束
    @IBOutlet weak var containerHeightCons: NSLayoutConstraint!
    ///冲击波视图顶部约束
    @IBOutlet weak var scanLineCons: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cusomTabBar.selectedItem = cusomTabBar.items?[0]
        cusomTabBar.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startAnimation()
  
    }
    
    private func startAnimation()
    {
        self.scanLineCons.constant = -self.containerHeightCons.constant
        self.scanLineView.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.0, animations: {
            self.scanLineCons.constant = self.containerHeightCons.constant
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.scanLineView.layoutIfNeeded()
        })
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: --UITabBarDelegate
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem)
    {
        //修改容器高度
        if item.tag == 1 {
            self.containerHeightCons.constant = 300
            
        }else{
            self.containerHeightCons.constant = 150
        }
        
        //停止动画
        self.scanLineView.layer.removeAllAnimations()
        
        startAnimation()
    }


}
