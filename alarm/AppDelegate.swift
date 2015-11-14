//
//  AppDelegate.swift
//  alarm
//
//  Created by 張翔 on 2015/09/10.
//  Copyright (c) 2015年 sho. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let ringtoneFile: [String] = ["Radar","Uplift","Opening","Twinkle","Circuit","Ripples","Summit","Silk","Stargaze","Slow Rise","Chimes","Signal","Hillside","Night Owl","Playtime","Presto","Cosmic","By The Seaside","Illuminate","Signal","Crystals","Constellation","Sencha","Apex","Beacon","Waves","Radiate"]
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var audioPlayer: AVAudioPlayer!
    
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //userDefaltの初期値
        let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        
        saveData.registerDefaults(["number": 0])
        
                return true
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        //アプリ起動中の動作
        let audioPath: NSURL? = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(ringtoneFile[saveData.objectForKey("number") as! Int], ofType:"caf")!)
        
        do{
            try audioPlayer = AVAudioPlayer(contentsOfURL: audioPath!)
        }catch{
            print("error")
        }
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        let alert: UIAlertController = UIAlertController(title: "アラーム", message: "時間です", preferredStyle: UIAlertControllerStyle.Alert)
        let ok: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            self.audioPlayer.stop()
        }
        alert.addAction(ok)
        self.window!.rootViewController!.presentViewController(alert, animated: true, completion: nil)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

