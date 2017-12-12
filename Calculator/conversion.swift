//
//  conversion.swift
//  Calculator
//
//  Created by Benson Philipose on 11/10/17.
//  Copyright © 2017 Benson Philipose. All rights reserved.
//

import Foundation

struct conversion {
    var label: String
    var inputType: String
    var outputType: String
    
    init(label: String, inputType: String, outputType: String) {
        self.label = label
        self.inputType = inputType
        self.outputType = outputType
    }
}
