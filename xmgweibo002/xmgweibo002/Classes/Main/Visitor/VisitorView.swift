//
//  VisitorView.swift
//  xmgweibo002
//
//  Created by 罗心 on 15/11/2016.
//  Copyright © 2016 罗心. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    //MARK:- 提供快速通过xib创建类的方法
        class func visitorView() -> VisitorView {
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)?.last as! VisitorView
    }
    //MARK:- 控件的属性
    
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK:- 自定义函数
    func setupVisitorViewInfo(iconName: String, title: String){
        iconView.image = UIImage(named: iconName)
        tipLabel.text = title
        rotationView.isHidden = true
    }
    
    //MARK:- 旋转动画
    func addRotationAnimation(){
        //1.创建动画
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        //2.设置动画属性
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.repeatCount = MAXFLOAT
        animation.duration = 6
        animation.isRemovedOnCompletion = false
        //3.添加动画
        rotationView.layer.add(animation, forKey: nil)
    }

}
