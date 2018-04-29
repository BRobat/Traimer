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

    let fullSequenceTime = GlobalValues.sequenceTime + GlobalValues.breakTime
    let numberOfDots = 16
    
    var time = 0.0
    var timer = Timer()
    var interval = 1.0
    
    var timerIsValid = false
    
    
    @IBOutlet weak var minuteLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    
    @IBOutlet weak var stopBtn: RoundedButton!
    
    @IBOutlet weak var clockFace: UIView!
    
    @IBOutlet weak var dot1: Dot!
    @IBOutlet weak var dot2: Dot!
    @IBOutlet weak var dot3: Dot!
    @IBOutlet weak var dot4: Dot!
    @IBOutlet weak var dot5: Dot!
    @IBOutlet weak var dot6: Dot!
    @IBOutlet weak var dot7: Dot!
    @IBOutlet weak var dot8: Dot!
    @IBOutlet weak var dot9: Dot!
    @IBOutlet weak var dot10: Dot!
    @IBOutlet weak var dot11: Dot!
    @IBOutlet weak var dot12: Dot!
    @IBOutlet weak var dot13: Dot!
    @IBOutlet weak var dot14: Dot!
    @IBOutlet weak var dot15: Dot!
    @IBOutlet weak var dot16: Dot!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(TimerVC.action),userInfo: self, repeats: true)
        

    }
    
    @objc func action() {
        updateDots()
        if timerIsValid {
            time += interval
            updateMinutesLbl()
            updateSecondLbl()
        } else {
            
        }
        
        
    }
    
    // actions
    
    @IBAction func startBtnPressed(_ sender: RoundedButton) {
        validateTimer()
        setStopBtnLbl()
    }
    
    @IBAction func stopBtnPressed(_ sender: RoundedButton) {
        if timerIsValid {
            invalidateTimer()
            setStopBtnLbl()
        } else if time != 0.0{
            time = 0.0
            updateMinutesLbl()
            updateSecondLbl()
            setStopBtnLbl()
        } else {
            
        }
    }
    
    // minor functions
    
    
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
        let second = Int(time) % 60
        
        if second < 10 {
            secondLbl.text! = "0"+String(second)
        } else {
            secondLbl.text! = String(second)
        }
    }
    
    func setStopBtnLbl() {
        if timerIsValid == true {
            stopBtn.setTitle("stop", for: .normal)
        } else {
            stopBtn.setTitle("reset", for: .normal)
        }
    }
    
    func updateDots() {
        let clockFaceTime = Double(Int(time)%fullSequenceTime) + 1
        let timePerDot = Double(fullSequenceTime)/Double(numberOfDots)
        print("clockFaceTime:",clockFaceTime,"timePerDot:",timePerDot,"fullSequenceTime:",fullSequenceTime)
        let dots = [dot1, dot2, dot3, dot4, dot5, dot6, dot7, dot8, dot9, dot10, dot11, dot12, dot13, dot14, dot15, dot16]
        
        if clockFaceTime >= 1 {
            
            for dot in dots {
                dot?.setDotColorBlue()
            }
        }
        
       
            if clockFaceTime >= timePerDot {
                dot1.clearDot()
            }
        
        
        if clockFaceTime >= timePerDot*2 {
            dot2.clearDot()
        }
        if clockFaceTime >= timePerDot*3 {
            dot3.clearDot()
        }
        if clockFaceTime >= timePerDot*4 {
            dot4.clearDot()
        }
        if clockFaceTime >= timePerDot*5 {
            dot5.clearDot()
        }
        if clockFaceTime >= timePerDot*6 {
            dot6.clearDot()
        }
        if clockFaceTime >= timePerDot*7 {
            dot7.clearDot()
        }
        if clockFaceTime >= timePerDot*8 {
            dot8.clearDot()
        }
        if clockFaceTime >= timePerDot*9 {
            dot9.clearDot()
        }
        if clockFaceTime >= timePerDot*10 {
            dot10.clearDot()
        }
        if clockFaceTime >= timePerDot*11 {
            dot11.clearDot()
        }
        if clockFaceTime >= timePerDot*12 {
            dot12.clearDot()
        }
        if clockFaceTime >= timePerDot*13 {
            dot13.clearDot()
        }
        if clockFaceTime >= timePerDot*14 {
            dot14.clearDot()
        }
        if clockFaceTime >= timePerDot*15 {
            dot15.clearDot()
        }
        if clockFaceTime >= timePerDot*16 {
            dot16.clearDot()
        }
    }
    
    
}

