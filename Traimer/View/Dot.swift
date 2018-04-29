//
//  Dot.swift
//  Traimer
//
//  Created by Tohil on 29/04/2018.
//  Copyright © 2018 Robat. All rights reserved.
//

import UIKit

class Dot: UIView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 12
    }
    
    func setDotColorBlue() {
        self.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
    }
    
    func setDotColorRed() {
        self.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }
    
    func clearDot() {
        self.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.1)
    }
    
}
