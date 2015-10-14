//
//  ViewController.swift
//  alarm
//
//  Created by 張翔 on 2015/09/23.
//  Copyright (c) 2015年 sho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    @IBOutlet var Button4: UIButton!
    @IBOutlet var Button5: UIButton!
    @IBOutlet var Button6: UIButton!
    @IBOutlet var Button7: UIButton!
    @IBOutlet var Button8: UIButton!
    @IBOutlet var Button9: UIButton!
    @IBOutlet var Button0: UIButton!
    @IBOutlet var Set: UIButton!
    @IBOutlet var Clear: UIButton!
    
    var selectLabel: Int = 1
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ローカル通知全削除
        //UIApplication.sharedApplication().cancelAllLocalNotifications()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button1(){
        tappedbutton(1)
    }
    
    @IBAction func button2(){
        tappedbutton(2)
    }

    @IBAction func button3(){
        tappedbutton(3)
    }

    @IBAction func button4(){
        tappedbutton(4)
    }

    @IBAction func button5(){
        tappedbutton(5)
    }

    @IBAction func button6(){
        tappedbutton(6)
    }

    @IBAction func button7(){
        tappedbutton(7)
    }

    @IBAction func button8(){
        tappedbutton(8)
    }

    @IBAction func button9(){
        tappedbutton(9)
    }

    @IBAction func button0(){
        tappedbutton(0)
    }

    @IBAction func set(){
        let nowDate: NSDate = NSDate()
        let nowCalendar: NSCalendar = NSCalendar.currentCalendar()
        let nowComps = nowCalendar.components([NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: nowDate)
        var nowHour: Int = nowComps.hour
        let nowMinute: Int = nowComps.minute
        let nowSecond: Int = nowComps.second
        var distantHour: Int!
        var distantMinute: Int!
        let setHour: Int = Int(label1.text!)! * 10 + Int(label2.text!)!
        let setMinutes: Int = Int(label3.text!)! * 10 + Int(label4.text!)!
        var samedate: Bool = false
        let hourString: String = NSString(format: "%02d", setHour) as String
        let minuteString: String = NSString(format: "%02d", setMinutes) as String
        
        
        //同じ時間にアラームがセットされていないか確認
        let notifications = UIApplication.sharedApplication().scheduledLocalNotifications
        for aNotification in notifications!{
            let userinfo: NSDictionary = aNotification.userInfo!
            if userinfo["timeID"] as! String == hourString + minuteString{
                samedate = true
            }
        }
                
        if samedate == false{
            //ローカル通知の設定
            if setMinutes >= nowMinute{
                distantMinute = setMinutes - nowMinute
            }else{
                distantMinute = setMinutes - nowMinute + 60
                nowHour = nowHour + 1
            }
            if setHour >= nowHour{
                distantHour = setHour - nowHour
            }else{
                distantHour = setHour - nowHour + 24
            }
            
            let notification = UILocalNotification()
            notification.fireDate = NSDate(timeIntervalSinceNow: Double((distantHour * 60 + distantMinute) * 60 - nowSecond))
            notification.timeZone = NSTimeZone.defaultTimeZone()
            notification.alertBody = "アラーム"
            notification.alertAction = "開く"
            notification.soundName = "alarm.caf"
            notification.userInfo = ["timeID": hourString + minuteString, "hour": String(setHour), "minute": String(setMinutes)]
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
            
            
            //ログ表示
            let notifications = UIApplication.sharedApplication().scheduledLocalNotifications
            for aNotification in notifications!{
                let userinfo: NSDictionary = aNotification.userInfo!
                print(userinfo["timeID"])
            }
        }
        
        
        //入力画面の初期化
        selectLabel = 1
        changeEnabled([Button3, Button4, Button5, Button6, Button7, Button8, Button9], enabled: false)
        label1.text = "0"
        label2.text = "0"
        label3.text = "0"
        label4.text = "0"
        label1.backgroundColor = UIColor.orangeColor()
        label2.backgroundColor = nil
        label3.backgroundColor = nil
        label4.backgroundColor = nil

        
        
        //alartを表示
        let alart: UIAlertController = UIAlertController(title: "アラートをセット", message: hourString +  "時" + minuteString + "分にセットしました。マナーモード、おやすみモードのときは音が鳴らないのでご注意ください", preferredStyle: UIAlertControllerStyle.Alert)
        let okButton: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            print("")
        }
        alart.addAction(okButton)
        self.presentViewController(alart, animated: true, completion: nil)
    }
    
    @IBAction func clear(){
        switch selectLabel{
        case 1:
            label1.text = "0"
        case 2:
            selectLabel = 1
            label1.backgroundColor = UIColor.orangeColor()
            label2.backgroundColor = nil
            changeEnabled([Button3, Button4, Button5, Button6, Button7, Button8, Button9], enabled: false)
            label1.text = "0"
        case 3:
            selectLabel = 2
            label2.backgroundColor = UIColor.orangeColor()
            label3.backgroundColor = nil
            if label1.text == "2" {
                changeEnabled([Button4, Button5], enabled: false)
            }else{
                changeEnabled([Button6, Button7, Button8, Button9], enabled: true)
            }
            label2.text = "0"
        case 4:
            if label4.text != "0"{
                label4.text = "0"
            }else{
                selectLabel = 3
            label3.backgroundColor = UIColor.orangeColor()
            label4.backgroundColor = nil
            changeEnabled([Button6, Button7, Button8, Button9], enabled: false)
            label3.text = "0"
            }
        default:
            print("clear error")
        }
    }
    

    //ボタンが押された時の処理
    func tappedbutton(number: Int){
        switch selectLabel{
        case 1:
            label1.text = String(number)
            selectLabel = 2
            label1.backgroundColor = nil
            label2.backgroundColor = UIColor.orangeColor()
            if number == 2{
                changeEnabled([Button3], enabled: true)
            }else{
                changeEnabled([Button3, Button4, Button5, Button6, Button7, Button8, Button9], enabled: true)
            }
        case 2:
            label2.text = String(number)
            selectLabel = 3
            label2.backgroundColor = nil
            label3.backgroundColor = UIColor.orangeColor()
            changeEnabled([Button4, Button5], enabled: true)
            changeEnabled([Button6, Button7, Button8, Button9], enabled: false)
        case 3:
            label3.text = String(number)
            selectLabel = 4
            label3.backgroundColor = nil
            label4.backgroundColor = UIColor.orangeColor()
            changeEnabled([Button6, Button7, Button8, Button9], enabled: true)
        case 4:
            label4.text = String(number)
        default:
            print("tappedbutton error")
        }
    }
    
    //ボタンのenableを変更
    func changeEnabled(button: [UIButton!], enabled: Bool){
        if enabled == true{
            for abutton in button{
                abutton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                abutton.enabled = true
            }
        }else{
            for abutton in button{
                abutton.setTitleColor(UIColor(white: 0.70, alpha: 1), forState: UIControlState.Normal)
                abutton.enabled = false
            }
        }
    }
    
    

   

}
