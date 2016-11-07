//
//  ZCHomeViewController.swift
//  Weibo
//
//  Created by LPPZ-User02 on 2016/11/3.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

import UIKit

class ZCHomeViewController: ZCBaseViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //如果没有登录，就设置为登录信息
//        if  !userLogin {
//            visitorView?.setUpVisitorInfo(isHome: true, imageName: "visitordiscover_feed_image_house", message: "测试测试测试测试测试测试测试测试")
//        }
        //初始化导航条
        setUpNav()
        
        //注册通知，监听菜单
        NotificationCenter.default.addObserver(self, selector: #selector(change), name: ZCPopoverAnimatorWillShow, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(change), name: ZCPopoverAnimatorWillDismiss, object: nil)
    }
    
    
    private func setUpNav()
    {
        /**
        let leftBtn = UIButton(type: UIButtonType.custom)
        leftBtn.setImage(UIImage.init(named: "navigationbar_friendattention"), for: UIControlState.normal)
        leftBtn.setImage(UIImage.init(named: "navigationbar_friendattention_highlighted"), for: UIControlState.highlighted)
        leftBtn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)**/
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(leftItemClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.createBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(rightItemClick))
        
        let titleBtn = ZCTitleButton(type: UIButtonType.custom)
        titleBtn.setTitle("极客江南 ", for: UIControlState.normal)
        titleBtn.addTarget(self, action: #selector(titleBtnClick(btn:)), for: UIControlEvents.touchUpInside)
//        titleBtn.sizeToFit()
        //titleBtn.imageEdgeInsets = UIEdgeInsetsMake(0,100, 0,0)
        navigationItem.titleView = titleBtn
        
    }
    
    func titleBtnClick(btn:ZCTitleButton)
    {
//        btn.isSelected = !btn.isSelected
        
        let popover = ZCPopoverViewController()
//        popover.transitioningDelegate = self
        popover.transitioningDelegate = popoverAnimator
        popover.modalPresentationStyle = UIModalPresentationStyle.custom
        present(popover, animated: true, completion: nil)
        
    }
    
    func leftItemClick(){
        print(#function)
    }
    
    func rightItemClick(){
        let qrcodeVC = ZCQRCodeViewController()
//        qrcodeVC.title = "扫一扫"
//        qrcodeVC.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(qrcodeVC, animated: true)
        present(qrcodeVC, animated: true, completion: nil)
    }
    
    //修改标题按钮的状态
    func change(){
        let titleBtn = navigationItem.titleView as! ZCTitleButton
        titleBtn.isSelected = !titleBtn.isSelected
    }
  
    //MARK: --懒加载
    //一定要定义一个对象来保存转场对象，否则会报错
    private lazy var popoverAnimator:ZCPopoverAnimator = {
       let pa = ZCPopoverAnimator()
        pa.presentFrame = CGRect(x: 100, y: 56, width: 200, height: 350)
        return pa
    }()

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

//extension ZCHomeViewController
