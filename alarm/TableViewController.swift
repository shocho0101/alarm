//
//  TableViewController.swift
//  alarm
//
//  Created by 張翔 on 2015/09/16.
//  Copyright (c) 2015年 sho. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var minuteArray: [Int] = []
    var hourArray: [Int] = []
    var TimeStringArray: [String] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.minuteArray = appDelegate.minuteArray
        self.hourArray = appDelegate.hourArray
        self.TimeStringArray = appDelegate.timeStringArray
        
        table.dataSource = self
        table.delegate = self
        
        println(TimeStringArray)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var number: Int = TimeStringArray.count
        return TimeStringArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell!
        cell.textLabel?.text = self.TimeStringArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("selected")
    }

    }
