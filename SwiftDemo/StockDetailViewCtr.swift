//
//  StockDetailViewCtr.swift
//  SwiftDemo
//
//  Created by 林小果 on 15/12/30.
//  Copyright © 2015年 林小果. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyJSON

class StockDetailViewCtr: BaseViewController {

    var stock: Stock!
    private var time: NSTimer!
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var lblPrice: UILabel?
    @IBOutlet weak var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = stock?.name
        setLeftBtn()
        
        let string = stock.dayurl
        let URL = NSURL(string: string!)
        imageView?.kf_setImageWithURL(URL!, placeholderImage: nil,
            optionsInfo: [.Transition(ImageTransition.Fade(1))])
        
        refresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func backAction() {
        stopTime()
        super.backAction()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        stopTime()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        startTime()
    }
    
    func startTime() {
        stopTime()
        time = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "getData", userInfo: nil, repeats: true)
    }
    
    func stopTime() {
        if (time != nil) {
            time.invalidate()
            time = nil
        }
    }

    func getData() {
        let list = "1";
        let stockid = stock.code
        let headers = [
            "apikey": baidu_key,
        ]
        let request = Alamofire.request(.GET, "http://apis.baidu.com/apistore/stockservice/stock", parameters: ["list": list, "stockid": stockid], headers: headers)
        request.responseJSON { response in
            print("请求地址:" + String(response.request))
            
            if let jsonString = response.result.value {
                let json = JSON(jsonString)
                print("返回数据: \(json)")
                
                let stockinfo = json["retData"]["stockinfo"]
                for (_,subJson):(String, JSON) in stockinfo {
                    let dic = subJson.dictionaryObject!
                    let stock:Stock = Stock.parse(dict: dic)
                    self.stock = stock
                }
                self.refresh()
            }
        }
    }
    
    func refresh() {
        lblName?.text = stock.name
        lblPrice!.text = "￥\(String(format: "%.2f", stock.currentPrice.floatValue))"
        
        if (stock.currentPrice.floatValue < stock.closingPrice.floatValue) {
            lblPrice?.textColor = UIColor.greenColor()
        } else {
            lblPrice?.textColor = UIColor.redColor()
        }
    }

}
