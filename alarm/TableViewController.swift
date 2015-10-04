//
//  TableViewController.swift
//  alarm
//
//  Created by 張翔 on 2015/10/04.
//  Copyright (c) 2015年 sho. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var notifications = UIApplication.sharedApplication().scheduledLocalNotifications

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var notifications = UIApplication.sharedApplication().scheduledLocalNotifications
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        var userinfo: NSDictionary = notifications[indexPath.row].userInfo!!
        cell.timeLabel.text = (userinfo["hour"] as? String)! + ":" + (userinfo["minute"] as? String)!
        


        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    

  
}
