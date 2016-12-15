//
//  LXUIPresentationController.swift
//  xmgweibo002
//
//  Created by 罗心 on 17/11/2016.
//  Copyright © 2016 罗心. All rights reserved.
//

import UIKit

class LXUIPresentationController: UIPresentationController {
    
    var presentedFrame = CGRect.zero

    //MARK:- 懒加载属性
    fileprivate lazy var coverView = UIView()
    
    //MARK:- 系统回调函数
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        //1.设置弹出view尺寸
        presentedView?.frame = presentedFrame
        
        //2.添加蒙版
        setupCoverView()
    }
}


//MARK:- 设置UI界面相关
extension LXUIPresentationController{
    fileprivate func setupCoverView(){
        //1.添加蒙版
        containerView?.insertSubview(coverView, at: 0)
        
        //2.设置蒙版属性
        coverView.backgroundColor = UIColor(white: 0.5, alpha: 0.3)
        coverView.frame = containerView!.bounds
        
        //3.添加手势
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LXUIPresentationController.coverViewClick))
        coverView.addGestureRecognizer(tapGesture)

    }
}

//MARK:- 监听事件
extension LXUIPresentationController{
    @objc fileprivate func coverViewClick(){
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}

