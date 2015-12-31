//
//  NewsViewCtr.swift
//  SwiftDemo
//
//  Created by 林小果 on 15/12/31.
//  Copyright © 2015年 林小果. All rights reserved.
//

import UIKit

class NewsViewCtr: BaseViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setLeftBtn()
        title = "资讯详情"
        let url = NSURL(string: "http://www.baidu.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
