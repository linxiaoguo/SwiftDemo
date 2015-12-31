//
//  BaseViewController.swift
//  SwiftDemo
//
//  Created by 林小果 on 15/12/29.
//  Copyright © 2015年 林小果. All rights reserved.
//

import UIKit
import Foundation

class BaseViewController: UIViewController {

    //构造
    override func viewDidLoad() {
        print("\(self.classForCoder).viewDidLoad()")
        super.viewDidLoad()
    }
    
    //析构
    deinit {
        print("\(self.classForCoder).deinit")
    }
    
    //内存警告
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //导航栏左侧按钮
    func setLeftBtn() {
        self.setLeftBtn("返回", norImg: "", highImg: "", target: self, action: "backAction")
    }
    
    //导航栏左侧按钮
    func setLeftBtn(title: String, norImg: String, highImg: String, target: AnyObject?, action: Selector) {
        let leftButton = UIButton(type: .Custom)
        leftButton.frame = CGRectMake(0, 0, 44, 44)
        leftButton.setTitle(title, forState: .Normal)
        if !norImg.isEmpty {
            leftButton.setBackgroundImage(UIImage(named: norImg), forState: .Normal)
        }
        if !highImg.isEmpty {
            leftButton.setBackgroundImage(UIImage(named: highImg), forState: .Highlighted)
        }
        leftButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        leftButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        leftButton.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        let backBar = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = backBar
    }
    
    //导航栏左侧按钮
    func setRightBtn(title: String, norImg: String, highImg: String, target: AnyObject?, action: Selector) {
        let rightButton = UIButton(type: .Custom)
        rightButton.frame = CGRectMake(0, 0, 44, 44)
        rightButton.setTitle(title, forState: .Normal)
        rightButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        if !norImg.isEmpty {
            rightButton.setBackgroundImage(UIImage(named: norImg), forState: .Normal)
        }
        if !highImg.isEmpty {
            rightButton.setBackgroundImage(UIImage(named: highImg), forState: .Highlighted)
        }
        rightButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        rightButton.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        let rightBar = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightBar
    }
    
    //pop返回
    func backAction() {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
