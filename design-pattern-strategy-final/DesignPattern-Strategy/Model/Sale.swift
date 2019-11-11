//
//  Sale.swift
//  DesignPattern-Strategy
//
//  Created by Andriu Felipe Coelho on 05/11/19.
//  Copyright © 2019 Andriu Felipe Coelho. All rights reserved.
//

import UIKit

class Sale: NSObject {
    
    private(set) var value: Double
    
    init(value: Double) {
        self.value = value
    }
}
