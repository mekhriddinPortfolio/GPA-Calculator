//
//  Helper.swift
//  GPACalculator
//
//  Created by Mekhriddin Jumaev on 07/02/23.
//

import UIKit

struct UIHelper {
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let with = view.bounds.width
        let padding: CGFloat = 12
        let minumumItemSpacing: CGFloat  = 10
        let availableWith = with - (padding * 2) - (minumumItemSpacing * 2)
        let itemWith  = availableWith / 3
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWith, height: 50)
        return flowLayout
    }
}
