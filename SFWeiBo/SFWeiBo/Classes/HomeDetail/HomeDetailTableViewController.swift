//
//  HomeDetailTableViewController.swift
//  SFWeiBo
//
//  Created by ShaoFeng on 16/7/6.
//  Copyright © 2016年 ShaoFeng. All rights reserved.
//

import UIKit

class HomeDetailViewController: UIViewController {

    var currentStatus: Status? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "微博正文"
        
        setTableView()
        setFooterButton()
    }
    
    private func setTableView() {
        view.addSubview(tableView)
        tableView.AlignInner(type: AlignType.TopLeft, referView: view, size: CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.size.height - 44), offset: CGPointMake(0, 0))
        tableView.tableFooterView = UIView()
        tableView.registerClass(StatusNormalTableViewCell.self, forCellReuseIdentifier: StatusTableViewCellIdentifier.NormalCell.rawValue)
        tableView.registerClass(StatusForwardTableViewCell.self, forCellReuseIdentifier: StatusTableViewCellIdentifier.ForwardCell.rawValue)
    }
    
    private func setFooterButton() {
        view.addSubview(footerButton)
        footerButton.AlignVertical(type: AlignType.BottomLeft, referView: tableView, size: CGSizeMake(UIScreen.mainScreen().bounds.width, 44), offset: CGPointMake(0, 0))
    }

    //MARK: - 懒加载
    private lazy var footerButton: StatusTableViewBottomView = StatusTableViewBottomView()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeDetailViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            
            //拿到cell(dequeue不要选用有IndexPath方法的)
            var cell = tableView.dequeueReusableCellWithIdentifier(StatusTableViewCellIdentifier.cellID(currentStatus!)) as? StatusTableViewCell
            if (cell == nil) {
                cell = StatusTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: StatusTableViewCellIdentifier.cellID(currentStatus!))
            }
            //拿到cell对应的行高
            return cell!.rowHeight(currentStatus!) - 40
            
        } else {
            return 60
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(StatusTableViewCellIdentifier.cellID(currentStatus!)) as? StatusTableViewCell
        if (cell == nil) {
            cell = StatusTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: StatusTableViewCellIdentifier.cellID(currentStatus!))
        }
        cell?.status = currentStatus
        cell?.footerView.hidden = true
        return cell!
    }
}