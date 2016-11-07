//
//  ZCBaseViewController.swift
//  Weibo
//
//  Created by LPPZ-User02 on 2016/11/4.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

import UIKit

class ZCBaseViewController: UITableViewController,ZCVisitorViewDelegate {
 


    var userLogin = true
    var visitorView:ZCVisitorView?
    
    override func loadView() {
        userLogin ? super.loadView():setUpVisitorView()
    }
    
    private func setUpVisitorView()  {
        let customView = ZCVisitorView()
        view = customView.getXib()
        customView.delegate = self
        visitorView = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func registerBtnWillClick()
    {
        print(#function)
    }
    
    func loginClickBtnWill()
    {
         print(#function)
    }
}
