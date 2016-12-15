//
//  MainViewController.swift
//  xmgweibo002
//
//  Created by 罗心 on 15/11/2016.
//  Copyright © 2016 罗心. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    // MARK:- 懒加载属性
    fileprivate lazy var composeBtn : UIButton = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComposeBtn()
     }
}

// MARK:- 设置UI界面
extension MainViewController{
    /// 设置发布按钮
    fileprivate func setupComposeBtn(){
        //1.将composeBtn添加到tabbar中
        tabBar.addSubview(composeBtn)
        
        composeBtn.center = CGPoint.init(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
        
        //2.监听发布按钮点击事件
        composeBtn.addTarget(self, action: #selector(MainViewController.composeBtnClick), for: .touchUpInside)
    }
    

}

// MARK:- 事件监听
extension MainViewController {
    @objc fileprivate func composeBtnClick() {
        LXLog(message: "composeBtnClicked")
    }
}
