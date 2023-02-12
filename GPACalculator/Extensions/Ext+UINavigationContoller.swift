//
//  Ext+UINavigationContoll.swift
//  GPACalculator
//
//  Created by Mekhriddin Jumaev on 03/02/23.
//

import UIKit

extension UINavigationController {
    
    func backgroundColor(backgroundcolor: UIColor) {
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.barTintColor = UIColor(named: "BackgroundColor")
    }
}
