

//
//  PersonInfoViewController.swift
//  SFWeiBo
//
//  Created by ShaoFeng on 16/7/19.
//  Copyright © 2016年 ShaoFeng. All rights reserved.
//

import UIKit

class PersonInfoViewController: UIViewController {

    var user: User?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        title = user?.name
        view.addSubview(tableView)
    }
    
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.frame = UIScreen.mainScreen().bounds
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension PersonInfoViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("id") as? PersonInfoTopTableViewCell
        if cell == nil {
            cell = (NSBundle.mainBundle().loadNibNamed("PersonInfoTopTableViewCell", owner: self, options: nil)).last as? PersonInfoTopTableViewCell
        }
        cell!.user = user
        return cell!
    }
    
}
