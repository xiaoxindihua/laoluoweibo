//
//  HomeViewController.swift
//  xmgweibo002
//
//  Created by 罗心 on 15/11/2016.
//  Copyright © 2016 罗心. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //MARK:-懒加载属性
    fileprivate lazy var viewBtn: TitleButton = TitleButton()
    fileprivate lazy var popoverAnimation: PopoverAnimation = PopoverAnimation { [weak self] (presented) -> () in
        self?.viewBtn.isSelected = presented
    }

    //MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.addRotationAnimation()
        
        //1.没有登录时设置内容
        if !isLogin {
            return
        }
        
        
        //2.设置导航栏内容
        setupNavigationBar()
    }

}

// MARK:- 设置UI界面
extension HomeViewController {
    fileprivate func setupNavigationBar(){
        //1. 设置左右侧item
     
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        //2.titleView
        
        viewBtn.setTitle("xiaoxindihua", for: .normal)
        viewBtn.addTarget(self, action: #selector(HomeViewController.titleBtnClick), for: .touchUpInside)

        navigationItem.titleView = viewBtn
        
    }
}

//MARK:- 事件监听
extension HomeViewController{
    @objc fileprivate func titleBtnClick(titleBtn: TitleButton){
        LXLog(message: "TitleButtonClick")
        
        //2.创建弹出控制器
        let popoverVc = PopoverViewController()
        
        popoverVc.modalPresentationStyle = .custom
        
        //3.设置转场代理
        popoverVc.transitioningDelegate = popoverAnimation
        popoverAnimation.presentedFrame = CGRect(x: 100, y: 55, width: 180, height: 250)
        
        //3.弹出控制器
        present(popoverVc, animated: true, completion: nil)
        
    }
}
