//
//  AppDelegate.swift
//  xmgweibo002
//
//  Created by 罗心 on 15/11/2016.
//  Copyright © 2016 罗心. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 设置全局颜色
        UITabBar.appearance().tintColor = UIColor.orange
        UINavigationBar.appearance().tintColor = UIColor.orange
        
       
        return true
    }


}

func LXLog<T>(message: T,fileName:String = #file, methodName:String = #function, lineNumber:Int = #line){
    #if DEBUG
        print("\((fileName as NSString).pathComponents.last!).\(methodName)[\(lineNumber)]:\(message)")
    #endif
}
