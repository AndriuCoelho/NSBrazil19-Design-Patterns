//
//  MinimumDiscount.swift
//  DesignPattern-Strategy
//
//  Created by Andriu Felipe Coelho on 05/11/19.
//  Copyright © 2019 Andriu Felipe Coelho. All rights reserved.
//

import UIKit

class MinimumDiscount: Discount {
    func calculate(_ sale: Sale) -> Double {
        return sale.value * 0.5
    }
}
