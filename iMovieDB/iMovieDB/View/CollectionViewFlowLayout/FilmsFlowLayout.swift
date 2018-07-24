//
//  FilmsFlowLayout.swift
//  iMovieDB
//
//  Created by Danilo on 24/07/2018.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit

class FilmsFlowLayout: UICollectionViewFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
