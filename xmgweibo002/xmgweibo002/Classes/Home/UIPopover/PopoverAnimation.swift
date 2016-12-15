//
//  PopoverAnimation.swift
//  xmgweibo002
//
//  Created by 罗心 on 17/11/2016.
//  Copyright © 2016 罗心. All rights reserved.
//

import UIKit

class PopoverAnimation: NSObject {
    
    //对外提供属性
    
    var isPresented = false
    var presentedFrame = CGRect.zero
    
    var callBack: ((_ isPresented: Bool) -> ())?
    
   
    
    init(callBack: @escaping (_ presented: Bool) -> ()) {
        self.callBack = callBack
    }
}



//MARK:- 转场代理
extension PopoverAnimation: UIViewControllerTransitioningDelegate{
    //改变弹出view的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentation = LXUIPresentationController(presentedViewController: presented, presenting: presenting)
        presentation.presentedFrame = presentedFrame
        return presentation
    }
    
    //弹出动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        callBack! (isPresented)
        return self
    }
    
    //消失动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        callBack! (isPresented)

        return self
    }
}

// MARK:- 弹出和消失动画代理方法
extension PopoverAnimation : UIViewControllerAnimatedTransitioning {
    //动画执行时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    //获取转场上下文
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresented ? animationForPresentedView(transitionContext) : animationForDismissedView(transitionContext)
    }
    
    /// 自定义弹出动画
    fileprivate func animationForPresentedView(_ transitionContext: UIViewControllerContextTransitioning){
        // 获取弹出view
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        //将弹出的view添加到containerView中
        transitionContext.containerView.addSubview(presentedView)
        
        //执行动画
        presentedView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        presentedView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentedView.transform = CGAffineTransform.identity
        }, completion: {
            (_) -> Void in transitionContext.completeTransition(true)
        })
    }
    
    ///自定义消失动画
    fileprivate func animationForDismissedView(_ transitionContext: UIViewControllerContextTransitioning){
        let dismissView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissView.transform = CGAffineTransform(scaleX: 1.0, y: 0.000001)
        }, completion: { (_) -> Void in
            dismissView.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
        
        
    }
    
}


