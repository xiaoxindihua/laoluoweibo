//
//  BaseViewController.swift
//  xmgweibo002
//
//  Created by 罗心 on 15/11/2016.
//  Copyright © 2016 罗心. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {
    
    // MARK:- 懒加载属性
    lazy var visitorView = VisitorView.visitorView()
    
    //MARK:- 定义变量
    var isLogin = true
    
    //MARK:- 系统回调函数
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavationItems()
    }

}
//MARK:- 设置UI界面
extension BaseViewController {
    
    ///设置访客视图
    fileprivate func setupVisitorView(){
        view = visitorView
        visitorView.registerBtn.addTarget(self, action: #selector(BaseViewController.registerBtnClick), for: .touchUpInside)
        visitorView.loginBtn.addTarget(self, action: #selector(BaseViewController.loginBtnClick), for: .touchUpInside)
          navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(BaseViewController.registerBtnClick))
    }
    
    ///设置导航栏左右item
    fileprivate func setupNavationItems(){
      
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(BaseViewController.loginBtnClick))
    }
}



//MARK:- 事件监听
extension BaseViewController {
    
   @objc fileprivate func registerBtnClick(){
        LXLog(message: "registerBtnClicked")
    }
    
    @objc fileprivate func loginBtnClick(){
        LXLog(message: "loginBtnClicked")
    }
}
