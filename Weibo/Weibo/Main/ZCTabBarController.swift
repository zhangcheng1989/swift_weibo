//
//  ZCTabBarController.swift
//  Weibo
//
//  Created by LPPZ-User02 on 2016/11/3.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

import UIKit

class ZCTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.orange
        
        //添加子控制器
        addChildViewControllers()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //添加加号按钮
        setUpConposeBtn()
    }
    
    private func setUpConposeBtn(){
        tabBar.addSubview(composeBtn)
        let width = UIScreen.main.bounds.size.width / CGFloat((viewControllers?.count)!)
        let height = 44
        let rect =  CGRect(x: 0, y: 0, width: Int(width), height: height)
        composeBtn.frame = rect.offsetBy(dx: 2 * width, dy: 0)
    }
    
    private func addChildViewControllers() {
        let path = Bundle.main.path(forResource:"MianVCSetting", ofType: "json")
        
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            do {
                //try：发生异常会跳到catch中继续执行
                //try!：发生异常程序直接崩溃
                let dictArr = try JSONSerialization.jsonObject(with: jsonData! as Data , options: JSONSerialization.ReadingOptions.mutableContainers)
                //在swift中如果需要遍历一个数组，需要明确数组类型
                for dict  in dictArr as! [[String:String]] {
                    //报错的原因是childViewControllerName参数必须有值，但是字典的返回值是可选类型
                    addChildVC(childViewControllerName: dict["vcName"]!, imageName: dict["imageName"]!, title: dict["title"]!)
                }
            } catch {
                print(error)
                
                addChildVC(childViewControllerName: "ZCHomeViewController", imageName: "tabbar_home",title: "首页")
                
                addChildVC(childViewControllerName: "ZCMessageViewController", imageName: "tabbar_message_center", title: "消息")
                
                addChildVC(childViewControllerName: "ZCAddViewController", imageName: "", title: "")
                
                addChildVC(childViewControllerName: "ZCDiscoverViewController", imageName: "tabbar_discover", title: "发现")
                
                addChildVC(childViewControllerName: "ZCProfileViewController", imageName: "tabbar_profile", title: "我")
            }
        }
        

    }
    
    //MARK: --初始化自控制器
    private func addChildVC(childViewControllerName:String,imageName:String,title:String)  {
        //动态获取命名空间
        let ns:String = Bundle.main.infoDictionary?["CFBundleExecutable"] as! String
        let cls:AnyClass? = NSClassFromString(ns+"."+childViewControllerName)
        //将AnyClass转换为指定类型
        let vcCls = cls as! UIViewController.Type
        //通过Class创建对象
        let vc = vcCls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named: imageName)
        vc.tabBarItem.selectedImage = UIImage.init(named: imageName+"_highlighted")
        let nav = ZCNavigationController(rootViewController: vc)
        addChildViewController(nav)
    }
    
    //MARK: --懒加载
    private lazy var composeBtn:UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        btn.addTarget(self, action: #selector(composeBtnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    func composeBtnClick() {
        self.present(ZCAddViewController(), animated: true, completion: nil)
    }
    
    /**
    private func addChildVC(vc:UIViewController,imageName:String,selImageName:String,title:String)  {
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named: imageName)
        vc.tabBarItem.selectedImage = UIImage.init(named: selImageName)
        let nav = ZCNavigationController(rootViewController: vc)
        addChildViewController(nav)
 
    }**/


}
