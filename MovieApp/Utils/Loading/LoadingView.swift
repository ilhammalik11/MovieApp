//
//  Loading.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Foundation

class LoadingView: UICollectionReusableView {
    
   @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.color = UIColor.white
    }
}
