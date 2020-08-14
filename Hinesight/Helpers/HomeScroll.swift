//
//  HomeScroll.swift
//  Hinesight
//
//  Created by Jaraad Hines on 8/14/20.
//  Copyright © 2020 Jaraad Hines. All rights reserved.
//

import Foundation
import UIKit

class HomeScroll
{
    var title = ""
    var featuredImage: UIImage
    var color: UIColor
    
    init(title: String, featuredImage: UIImage, color: UIColor)
    {
        self.title = title
        self.featuredImage = featuredImage
        self.color = color
    }
    
    static func fetchHomeScrolls() -> [HomeScroll]
    {
        return[
            HomeScroll(title: "A Night of Black Stories", featuredImage:
                UIImage(named: "f1")!, color:UIColor(red:63/255.0, green: 71/255.0, blue: 80/255.0, alpha:0.8)),
            
            HomeScroll(title: "Mobility Mentoring Training Online", featuredImage:
            UIImage(named: "f2")!, color:UIColor(red:63/255.0, green: 71/255.0, blue: 80/255.0, alpha:0.8)),
            
            HomeScroll(title: "Transportation Program Orientation", featuredImage:
            UIImage(named: "f3")!, color:UIColor(red:63/255.0, green: 71/255.0, blue: 80/255.0, alpha:0.8)),
            
        ]
    }
}
