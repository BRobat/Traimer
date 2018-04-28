//
//  ViewController.swift
//  Traimer
//
//  Created by Tohil on 27/04/2018.
//  Copyright © 2018 Robat. All rights reserved.
//

import UIKit
import SpriteKit



class TimerVC: UIViewController {

    var time = 0.0
    var timer = Timer()
    var interval = 1.0
    
    var timerIsValid = true
    
    
    
    @IBOutlet weak var minuteLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(TimerVC.action),userInfo: self, repeats: true)

    }
    
    @objc func action() {
        if timerIsValid {
            time += interval
            updateMinutesLbl()
            updateSecondLbl()
        } else {
            
        }
        
        
        
    }
    

    
    @IBAction func startBtnPressed(_ sender: UIButton) {
        validateTimer()
    }
    
    @IBAction func stopBtnPressed(_ sender: UIButton) {
        invalidateTimer()
    }
    
    
    
    
    func validateTimer() {
        timerIsValid = true
    }
    
    func invalidateTimer() {
        timerIsValid = false
    }
    
    func updateMinutesLbl() {
        minuteLbl.text! = String(Int(time / 60))
    }
    
    func updateSecondLbl() {
        let second = Int(Int(time) % 60)
        
        if second < 10 {
            secondLbl.text! = "0"+String(second)
        } else {
            secondLbl.text! = String(second)
        }
        
        
    }
    
}

