//
//  SettingTableViewController.swift
//  alarm
//
//  Created by 張翔 on 2015/11/01.
//  Copyright © 2015年 sho. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    let ringtoneName: [String] = ["レーダー(デフォルト)","アップリフト","オープニング","きらめき","サーキット","さざ波","サミット","シルク","スターゲイズ","スローライズ","チャイム","ニュース","ヒルサイド","フクロウ","プレイタイム","プレスト","宇宙","海岸で","照明","信号","水晶","星座","煎茶","頂点","灯台","波","放射"]
    let ringtoneFile: [String] = ["Radar.caf","Uplift.caf","Opening.caf","Twinkle.caf","Circuit.caf","Ripples.caf","Summit.caf","Silk.caf","Stargaze.caf","Slow Rize.caf","Chimes.caf","Signal.caf","Hillside.caf","Night Owl.caf","Playtime.caf","Presto.caf"]

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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ringtoneName.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SettingTableViewCell
        
        cell.Label.text = ringtoneName[indexPath.row]

        

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //チェックマークをつける
        for (var i = 0; i < tableView.numberOfRowsInSection(0); i++){
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forItem: i, inSection: 0))
            if indexPath.row == i{
                cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            }else{
                cell?.accessoryType = UITableViewCellAccessoryType.None
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        

    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
