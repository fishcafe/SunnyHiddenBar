//
//  UIViewController+SunnyHiddenBar.swift
//  SunnyHiddenBar
//
//  Created by amaker on 16/4/19.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

/** SunnyHiddenBar Extends UIViewController

*/
//定义关联的Key
let  key = "keyScrollView"
let navBarBackgroundImageKey = "navBarBackgroundImage"
let isLeftAlphaKey = "isLeftAlpha"
let isRightAlphaKey = "isRightAlpha"
let  isTitleAlphaKey = "isTitleAlpha"
var  alpha:CGFloat = 0;

public extension UIViewController {
    
    var keyScrollView:UIScrollView?{
        
        set{
            objc_setAssociatedObject(self, key, keyScrollView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get{
            return objc_getAssociatedObject(self, key) as? UIScrollView
        }
    }
    
    var navBarBackgroundImage:UIImage?{
        set{
            objc_setAssociatedObject(self, navBarBackgroundImageKey, navBarBackgroundImage, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get{
            return objc_getAssociatedObject(self, navBarBackgroundImageKey) as? UIImage
        }
        
    }
    
    var isLeftAlpha:Bool?{
        set{
            return objc_setAssociatedObject(self, isLeftAlphaKey, (isLeftAlpha), .OBJC_ASSOCIATION_ASSIGN)
        }
        get{
            
            return objc_getAssociatedObject(self, isLeftAlphaKey) as? Bool
        }
        
    }
    
    var isRightAlpha:Bool?{
        
        set{
         return objc_setAssociatedObject(self, isRightAlphaKey, (isRightAlpha), .OBJC_ASSOCIATION_ASSIGN)
        }
        
        get{
            
            return objc_getAssociatedObject(self, isRightAlphaKey) as? Bool
        }
        
    }
    
    var isTitleAlpha:Bool?{
        set{
            return objc_setAssociatedObject(self, isTitleAlphaKey, (isTitleAlpha), .OBJC_ASSOCIATION_ASSIGN)
        }
        
        get{
            return objc_getAssociatedObject(self, isTitleAlphaKey) as? Bool
        }
        
    }

func scrollControlByOffsetY(offsetY:CGFloat){
    if  self.getScrollerView() != Optional.None{
        let scrollerView = self.getScrollerView()
        alpha = scrollerView.contentOffset.y/offsetY
    }else {
        return
    }
    
    alpha = (alpha <= 0) ? 0 : alpha
    alpha = (alpha >= 1) ? 1 : alpha
    

    //TODO: titleView alpha no fix
    self.navigationItem.leftBarButtonItem?.customView?.alpha = (self.isLeftAlpha != nil) ? alpha : 1
    self.navigationItem.titleView?.alpha = (self.isTitleAlpha != nil) ? alpha : 1
    self.navigationItem.rightBarButtonItem?.customView?.alpha = (self.isRightAlpha != nil) ? alpha : 1
    self.navigationController?.navigationBar.subviews.first?.alpha = alpha

}
    
    func setInViewWillAppear() {
        struct Static {
            static var onceToken: dispatch_once_t = 0
        }
        dispatch_once(&Static.onceToken) {
            self.navBarBackgroundImage = self.navigationController?.navigationBar.backgroundImageForBarMetrics(.Default)
        }
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.subviews.first?.alpha = 0
        if self.keyScrollView != nil {
            self.getScrollerView().contentOffset = CGPointMake(0, self.keyScrollView!.contentOffset.y - 1)
            self.getScrollerView().contentOffset = CGPointMake(0, self.keyScrollView!.contentOffset.y + 1)
        }
    }
    
    func setInViewWillDisappear() {
        self.navigationController?.navigationBar.subviews.first?.alpha = 1
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = nil
        
    }
    
    
    func  getScrollerView() -> UIScrollView{
        
        if self.isKindOfClass(UITableViewController) || self.isKindOfClass(UICollectionViewController) {
            return self.view as! UIScrollView
        } else {
            for myView in self.view.subviews {
                if myView.isEqual(self.keyScrollView) && myView.isKindOfClass(UIScrollView) || myView.isEqual(self.keyScrollView) && view.isKindOfClass(UIScrollView){
                    return myView as! UIScrollView
                }
            }
        }
        return Optional.None!
    }
    


}
