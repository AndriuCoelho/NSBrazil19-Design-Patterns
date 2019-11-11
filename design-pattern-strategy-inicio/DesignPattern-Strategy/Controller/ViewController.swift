//
//  ViewController.swift
//  DesignPattern-Strategy
//
//  Created by Andriu Felipe Coelho on 05/11/19.
//  Copyright © 2019 Andriu Felipe Coelho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sale = Sale(value: 150.0)
        let discountCalculator = DiscountCalculator()
        
        discountCalculator.doCalculation(sale, "maximum")
    }


}

