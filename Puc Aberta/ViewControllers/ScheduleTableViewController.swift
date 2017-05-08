//
//  ScheduleTableViewController.swift
//  Puc Aberta
//
//  Created by Marco Braga on 08/05/17.
//  Copyright © 2017 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        self.edgesForExtendedLayout = .all;
        self.tableView.contentInset = UIEdgeInsetsMake(0.0, 0.0, (self.tabBarController?.tabBar.frame)!.height, 0);
    }
}
