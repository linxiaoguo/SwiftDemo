//
//  Stock.swift
//  SwiftDemo
//
//  Created by 林小果 on 15/12/29.
//  Copyright © 2015年 林小果. All rights reserved.
//

import UIKit

class Stock : Reflect{
    var code: NSNumber!              //股票代码
    var name: String!                //股票名称
    var date: String!                //当前显示股票信息的日期
    var time: String!                //具体时间
    var OpenningPrice: NSNumber!     //今日开盘价
    var closingPrice: NSNumber!      //昨日收盘价
    var currentPrice: NSNumber!      //当前价格
    
    var hPrice: NSNumber!            //今日最高价
    var lPrice: NSNumber!            //今日最低价
    var competitivePrice: NSNumber!  //买一报价
    var auctionPrice: NSNumber!      //卖一报价
    var totalNumber: NSNumber!       //成交的股票数
    var turnover: NSNumber!          //成交额，以元为单位
    var buyOne: NSNumber!            //买一
    var buyOnePrice: NSNumber!       //买一价格
    var buyTwo: NSNumber!            //买二
    var buyTwoPrice: NSNumber!       //买二价格
    var buyThree: NSNumber!          //买三
    var buyThreePrice: NSNumber!     //买三价格
    var buyFour: NSNumber!           //买四
    var buyFourPrice: NSNumber!      //买四价格
    var buyFive: NSNumber!           //买五
    var buyFivePrice: NSNumber!      //买五价格
    var sellOne: NSNumber!           //卖一
    var sellOnePrice: NSNumber!      //卖一价格
    var sellTwo: NSNumber!           //卖二
    var sellTwoPrice: NSNumber!      //卖二价格
    var sellThree: NSNumber!         //卖三
    var sellThreePrice: NSNumber!    //卖三价格
    var sellFour: NSNumber!          //卖四
    var sellFourPrice: NSNumber!     //卖四价格
    var sellFive: NSNumber!          //卖五
    var sellFivePrice: NSNumber!     //卖五价格
    
    var dayurl: String!              //今天视图
}

