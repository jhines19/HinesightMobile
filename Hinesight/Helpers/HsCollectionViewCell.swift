//
//  HsCollectionViewCell.swift
//  Hinesight
//
//  Created by Jaraad Hines on 8/14/20.
//  Copyright © 2020 Jaraad Hines. All rights reserved.
//

import Foundation
import UIKit

class HsCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var homeScrollTitleLabel: UILabel!
    
    var homeScroll: HomeScroll! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let homeScroll = homeScroll {
            featuredImageView.image = homeScroll.featuredImage
            homeScrollTitleLabel.text = homeScroll.title
            backgroundColorView.backgroundColor = homeScroll.color
        } else {
            featuredImageView.image = nil
            homeScrollTitleLabel.text = nil
            backgroundColorView.backgroundColor = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
}
