//
//  SettingsVC.swift
//  Traimer
//
//  Created by Tohil on 04/05/2018.
//  Copyright © 2018 Robat. All rights reserved.
//

import UIKit
import CoreData

class SettingsVC: UIViewController {
    
    @IBOutlet weak var excerciseLength: UITextField!
    @IBOutlet weak var breakLength: UITextField!
    
    
    override func viewDidLoad() {
        excerciseLength.text! = String(GlobalValues.sequenceTime)
        breakLength.text! = String(GlobalValues.breakTime)
        super.viewDidLoad()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(false)
        updateBreakTimeValues()
        updateExcerciseValues()
        saveBreakTimeValues()
        saveExcerciseTimeValues()
    }
    
    func updateExcerciseValues() {
        guard let excercise = Int(excerciseLength.text!) else {return}
        GlobalValues.sequenceTime = excercise
        print(excercise)
    }
    
    func updateBreakTimeValues() {
        guard let breakTm = Int(breakLength.text!) else {return}
        GlobalValues.breakTime = breakTm
        print(breakTm)
    }

    func saveExcerciseTimeValues() {
        UserDefaults.standard.set(String(GlobalValues.sequenceTime), forKey: "excercise")
    }
    
    func saveBreakTimeValues() {
        UserDefaults.standard.set(String(GlobalValues.breakTime), forKey: "break")
    }

}
