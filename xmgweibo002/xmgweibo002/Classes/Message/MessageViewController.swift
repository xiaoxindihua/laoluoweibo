//
//  MessageViewController.swift
//  xmgweibo002
//
//  Created by 罗心 on 15/11/2016.
//  Copyright © 2016 罗心. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView.setupVisitorViewInfo(iconName: "visitordiscover_image_message", title: "登录后，别人评论你的微博，给你发消息，都会在这里收到通知")

    }

}
