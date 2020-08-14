//
//  HsViewController.swift
//  Hinesight
//
//  Created by Jaraad Hines on 8/14/20.
//  Copyright © 2020 Jaraad Hines. All rights reserved.
//

import Foundation
import UIKit

class HomeScrollsViewController : UIViewController
{
@IBOutlet weak var collectionView: UICollectionView!
    var homeScrolls = HomeScroll.fetchHomeScrolls()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
    
    }
}

extension HomeScrollsViewController: UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) ->
    Int {
        return 1
}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeScrolls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HsCollectionViewCell", for: indexPath) as! HsCollectionViewCell
        let homeScroll = homeScrolls[indexPath.item]
        
        cell.homeScroll = homeScroll
        
        return cell
    }
    
}
