//
//  Circle.swift
//  Traimer
//
//  Created by Tohil on 03/05/2018.
//  Copyright © 2018 Robat. All rights reserved.
//

import UIKit

class Circle: UIView {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 140
        self.layer.borderWidth = 12
        self.layer.borderColor = UIColor(red: 39/255, green: 44/255, blue: 117/255, alpha: 1.0).cgColor
    }
    
}
