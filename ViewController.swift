//
//  ViewController.swift
//  alarm
//
//  Created by 張翔 on 2015/09/23.
//  Copyright (c) 2015年 sho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var labal1: UILabel!
    @IBOutlet var labal2: UILabel!
    @IBOutlet var labal3: UILabel!
    @IBOutlet var labal4: UILabel!
    
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
    
    var selectButton: Int = 1
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        
    }
    
    @IBAction func clear(){
        
    }

    func tappedbutton(number: Int){
        switch selectButton{
        case 1:
            labal1.text = String(number)
            selectButton = 2
        case 2:
            labal2.text = String(number)
            selectButton = 3
        case 3:
            labal3.text = String(number)
            selectButton = 4
        case 4:
            labal4.text = String(number)
        default:
            println("tappedbutton error")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
