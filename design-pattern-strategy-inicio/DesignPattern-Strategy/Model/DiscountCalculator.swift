//
//  DiscountCalculator.swift
//  DesignPattern-Strategy
//
//  Created by Andriu Felipe Coelho on 05/11/19.
//  Copyright © 2019 Andriu Felipe Coelho. All rights reserved.
//

import UIKit

class DiscountCalculator: NSObject {
    
    func doCalculation(_ sale: Sale, _ discount: String) {
        if discount == "maximum" {
            print(sale.value * 0.9)
        }
        else if discount == "minimum" {
            print(sale.value * 0.5)
        }
    }
}
