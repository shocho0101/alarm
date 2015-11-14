//
//  SettingTableViewController.swift
//  alarm
//
//  Created by 張翔 on 2015/11/01.
//  Copyright © 2015年 sho. All rights reserved.
//

import UIKit
import AVFoundation

class SettingTableViewController: UITableViewController {
    
    let ringtoneName: [String] = ["レーダー(デフォルト)","アップリフト","オープニング","きらめき","サーキット","さざ波","サミット","シルク","スターゲイズ","スローライズ","チャイム","ニュース","ヒルサイド","フクロウ","プレイタイム","プレスト","宇宙","海岸で","照明","信号","水晶","星座","煎茶","頂点","灯台","波","放射"]
    let ringtoneFile: [String] = ["Radar","Uplift","Opening","Twinkle","Circuit","Ripples","Summit","Silk","Stargaze","Slow Rise","Chimes","Signal","Hillside","Night Owl","Playtime","Presto","Cosmic","By The Seaside","Illuminate","Signal","Crystals","Constellation","Sencha","Apex","Beacon","Waves","Radiate"]
    
    var audioPlayer: AVAudioPlayer!
    
    var AppearingCell : [UITableViewCell] = []
    var playing: Bool = false
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()


    override func viewDidLoad() {
        super.viewDidLoad()
        playing = false
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
        if indexPath.row == (saveData.objectForKey("number")) as! Int{
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        //音楽再生
        let audioPath: NSURL? = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(ringtoneFile[indexPath.row], ofType:"caf")!)
        
        do{
            try audioPlayer = AVAudioPlayer(contentsOfURL: audioPath!)
        }catch{
            print("error")
        }
        if playing == false || saveData.objectForKey("number") as! Int != indexPath.row{
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            playing = true
        }else{
            audioPlayer.stop()
            playing = false
        }
    
        //選択解除
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    
        //チェックマークをつける
        saveData.setObject(indexPath.row, forKey: "number")
        tableView.reloadData()
        
        //既存のnotificationの変更
        let notifications = UIApplication.sharedApplication().scheduledLocalNotifications
        UIApplication.sharedApplication().cancelAllLocalNotifications()
        for aNotification in notifications!{
            aNotification.soundName = (ringtoneFile[indexPath.row] + ".caf")
            UIApplication.sharedApplication().scheduleLocalNotification(aNotification)
        }
        
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
