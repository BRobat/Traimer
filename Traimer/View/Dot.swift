//
//  Dot.swift
//  Traimer
//
//  Created by Tohil on 27/04/2018.
//  Copyright © 2018 Robat. All rights reserved.
//

import UIKit

class Dot: UIView {
    
    var isActive: Bool = false

    override func awakeFromNib() {
        self.awakeFromNib()
        self.layer.cornerRadius = 6
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    

}
