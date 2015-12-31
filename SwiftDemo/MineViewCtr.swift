//
//  MineViewCtr.swift
//  SwiftDemo
//
//  Created by 林小果 on 15/12/31.
//  Copyright © 2015年 林小果. All rights reserved.
//

import UIKit

class MineViewCtr: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataArray: [String] = ["设置", "安全中心", "评分", "关于"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let text = dataArray[indexPath.row]
        cell.textLabel?.text = text
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = BuildingViewCtr()
        vc.hidesBottomBarWhenPushed = true
        vc.title = dataArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
