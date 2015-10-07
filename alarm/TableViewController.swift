//
//  TableViewController.swift
//  alarm
//
//  Created by 張翔 on 2015/10/04.
//  Copyright (c) 2015年 sho. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var notifications = UIApplication.sharedApplication().scheduledLocalNotifications!

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        let notifications = UIApplication.sharedApplication().scheduledLocalNotifications!

        return notifications.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var notifications = UIApplication.sharedApplication().scheduledLocalNotifications
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        let userinfo: NSDictionary = notifications![indexPath.row].userInfo!
        let hourString: String = NSString(format: "%02d", Int(userinfo["hour"] as! String)!) as String
        let minuteString: String = NSString(format: "%02d",Int(userinfo["minute"] as! String)!) as String
        cell.hourLabel.text = hourString
        cell.minuteLabel.text = minuteString
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    }
    
    
    //スワイプで削除ボタンを表示
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete: UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "削除") { (action, indexPath) -> Void in
            NSLog("delete")
            var notifications = UIApplication.sharedApplication().scheduledLocalNotifications
            let aNotification = notifications![indexPath.row]
            UIApplication.sharedApplication().cancelLocalNotification(aNotification)
//            notifications?.removeAtIndex(indexPath.row)
//            tableView.reloadData()
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
        
        delete.backgroundColor = UIColor.redColor()
        
        return [delete]
        
    }
    

    
  
}
