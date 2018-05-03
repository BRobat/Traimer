//
//  ViewController.swift
//  Traimer
//
//  Created by Tohil on 27/04/2018.
//  Copyright © 2018 Robat. All rights reserved.
//

import UIKit
import AVFoundation



class TimerVC: UIViewController {

    let fullSequenceTime = GlobalValues.sequenceTime + GlobalValues.breakTime
    let numberOfDots = 16
    
    var time = 0.0
    var timer = Timer()
    var interval = 1.0
    var audioNode: AVAudioPlayer?
    
    var timerIsValid = false
    
    
    @IBOutlet weak var minuteLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    
    @IBOutlet weak var stopBtn: RoundedButton!
    @IBOutlet weak var startBtn: RoundedButton!
    
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
        playSounds()
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
        let minute = Int(time/60)
        
        if minute < 10 {
            minuteLbl.text! = "0"+String(minute)
        } else {
            minuteLbl.text! = String(minute)
        }
        
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
            stopBtn.setTitle("Stop", for: .normal)
        } else {
            stopBtn.setTitle("Reset", for: .normal)
        }
    }
    
    func updateDots() {
        let clockFaceTime = Double(Int(time)%fullSequenceTime) + 1
        let timePerDot = Double(fullSequenceTime)/Double(numberOfDots)
        print("clockFaceTime:",clockFaceTime,"timePerDot:",timePerDot,"fullSequenceTime:",fullSequenceTime)
        let dots = [dot1, dot2, dot3, dot4, dot5, dot6, dot7, dot8, dot9, dot10, dot11, dot12, dot13, dot14, dot15, dot16]
        var iteration = 0
        
        if clockFaceTime >= 1 {
            for dot in dots {
                dot?.setDotColorBlue()
            }
        }
        
        for dot in dots {
            if iteration <= dots.count{
                iteration += 1
                if clockFaceTime >= timePerDot*Double(iteration) {
                    dot?.clearDot()
                }
            } else {
                iteration = 0
            }
        }
    }
    
    func playSounds() {
        if Int(time) % fullSequenceTime == fullSequenceTime-1 {
            let path = Bundle.main.path(forResource: "C.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            do {
                audioNode = try AVAudioPlayer(contentsOf: url)
                audioNode?.prepareToPlay()
                audioNode?.play()
                print("playing Cdur")
            } catch {return}
        }
        
        if Int(time) % fullSequenceTime == GlobalValues.breakTime-1 {
            let path = Bundle.main.path(forResource: "Cdur.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            do {
                audioNode = try AVAudioPlayer(contentsOf: url)
                audioNode?.prepareToPlay()
                audioNode?.play()
                print("playing C")
            } catch {return}
        }
    }
    
    
}

