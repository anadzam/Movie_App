//
//  UIImage+Extensions.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 17.07.23.
//

import Foundation
import UIKit

extension UIImage {
    
    convenience init(assetIdentifier: Constants.AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)!
    }
}
