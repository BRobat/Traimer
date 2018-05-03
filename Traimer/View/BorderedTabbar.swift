//
//  BorderedTabbar.swift
//  Traimer
//
//  Created by Tohil on 03/05/2018.
//  Copyright © 2018 Robat. All rights reserved.
//

import UIKit

class BorderedTabbar: UITabBar {
    
    override func awakeFromNib() {
        
        self.layer.borderColor = UIColor(red: 39/255, green: 44/255, blue: 117/255, alpha: 1.0).cgColor
    }
    
}
