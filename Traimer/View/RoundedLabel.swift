//
//  RoundedLabel.swift
//  Traimer
//
//  Created by Tohil on 29/04/2018.
//  Copyright © 2018 Robat. All rights reserved.
//

import UIKit

class RoundedLabel: UILabel {

    override func awakeFromNib() {
        self.layer.cornerRadius = 12
    }
}
