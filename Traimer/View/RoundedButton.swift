//
//  RoundedButton.swift
//  Traimer
//
//  Created by Tohil on 29/04/2018.
//  Copyright © 2018 Robat. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 40
        self.layer.borderWidth = 10
        self.layer.borderColor = UIColor(red: 39/255, green: 44/255, blue: 117/255, alpha: 1.0).cgColor
        
        
        
    }

}
