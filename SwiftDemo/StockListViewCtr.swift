//
//  StockListViewCtr.swift
//  SwiftDemo
//
//  Created by 林小果 on 15/12/29.
//  Copyright © 2015年 林小果. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let baidu_key = "52800a6e48c1f9a248e869196e968924"

class StockListViewCtr: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var stockList: [Stock] = []
    var time: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "股票列表"
        tableView.registerNib(UINib(nibName: "StockListCell", bundle:nil), forCellReuseIdentifier: "StockListCell")
        getData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        //建设银行,工商银行,农业银行,兴业银行,光大银行,浦发银行,平安银行,银之杰,科大讯飞,机器人
        let stockid = "sh601939,sh601398,sh601288,sh601166,sh601818,sh600000,sz000001,sz300085,sz002230,sz300024"
        
        let headers = [
            "apikey": baidu_key,
        ]
        
        //http://apis.baidu.com/apistore/stockservice/stock?list=1&stockid=sh601166
        let request = Alamofire.request(.GET, "http://apis.baidu.com/apistore/stockservice/stock", parameters: ["list": list, "stockid": stockid], headers: headers)
            request.responseJSON { response in
            print("请求地址:" + String(response.request))
            
            if let jsonString = response.result.value {
                let json = JSON(jsonString)
                print("返回数据: \(json)")
                
                self.stockList.removeAll()
                let stockinfo = json["retData"]["stockinfo"]
                for (_,subJson):(String, JSON) in stockinfo {
                    let dic = subJson.dictionaryObject!
                    let stock:Stock = Stock.parse(dict: dic)
                    self.stockList.append(stock)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StockListCell") as! StockListCell
        let stock = stockList[indexPath.row]
        cell.lblName!.text = stock.name
        cell.lblPrice!.text = "￥\(String(format: "%.2f", stock.currentPrice.floatValue))"
        
        if (stock.currentPrice.floatValue < stock.closingPrice.floatValue) {
            cell.lblPrice!.textColor = UIColor.greenColor()
        } else {
            cell.lblPrice!.textColor = UIColor.redColor()
        }
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let stock = stockList[indexPath.row]
        let vc = StockDetailViewCtr()
        vc.stock = stock
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
