//
//  UIImageView.swift
//  iMovieDB
//
//  Created by Danilo on 24/01/2019.
//  Copyright © 2019 Danilo Bias. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
}
