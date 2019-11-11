//
//  DiscountCalculator.swift
//  DesignPattern-Strategy
//
//  Created by Andriu Felipe Coelho on 05/11/19.
//  Copyright © 2019 Andriu Felipe Coelho. All rights reserved.
//

import UIKit

protocol Discount {
    func calculate(_ sale: Sale) -> Double
}

class DiscountCalculator: NSObject {
    func doCalculation(_ sale: Sale, _ discount: Discount) {
        let discount = discount.calculate(sale)
        print(discount)
    }
}
