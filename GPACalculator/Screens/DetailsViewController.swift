//
//  DetailsViewController.swift
//  GPACalculator
//
//  Created by Mekhriddin Jumaev on 10/02/23.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.titleView = twoLineTitleView(text: "Settings")
        navigationController?.backgroundColor(backgroundcolor: UIColor.white)
    }

}
