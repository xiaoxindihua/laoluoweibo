//
//  UIBarButtonItem + extension.swift
//  xmgweibo002
//
//  Created by 罗心 on 16/11/2016.
//  Copyright © 2016 罗心. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    convenience init(imageName: String) {
        self.init()
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        
        self.customView = btn
    }
}
