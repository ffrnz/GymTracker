//
//  Ubung.swift
//  GymTracker
//
//  Created by Florian M. on 14/05/16.
//  Copyright © 2016 Florian M. All rights reserved.
//

import Foundation
import UIKit

class Ubung {
    // MARK: Properties
    var name: String
    var big: Bool
    var idealGewicht: Int
    
    init?(name: String, big: Bool, idealGewicht: Int) {
    self.name = name
    self.big = false
    self.idealGewicht = 50
    if name.isEmpty {
        return nil
        }
    }
}
