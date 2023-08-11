//
//  homeViewController+Extensions.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 18.07.23.
//

import Foundation
import UIKit

extension HomeViewController {
    
    enum Color {
        
        static let placeholderColor = UIColor(hex: 0xC7C7C7)
        static let bubbleColor = UIColor(hex: 0xF1F1F1)
        static let textColor = UIColor(hex: 0x191919)
        static let failedTextColor = UIColor(hex: 0x676767)
        
    }
    enum Texts {
        static let label: String = "Movies"
        static let placeholderColor = UIColor(hex: 0xC7C7C7)
        static let bubbleColor = UIColor(hex: 0xF1F1F1)
        static let textColor = UIColor(hex: 0x191919)
        static let failedTextColor = UIColor(hex: 0x676767)
        
    }
    
    enum CollectionViewSizing {
        static let itemWidth: Int = 164
        static let itemHeight: Int = 269
        static let top: CGFloat = 16
        static let leading: CGFloat = 16
        static let trailing: CGFloat = -16
        static let bottom: CGFloat = -16
        static let cellCornerRadius: CGFloat = 16
    }
    
    enum labelSizing {
        static let top: CGFloat = 77
        static let leading: CGFloat = 16
        static let trailing: CGFloat = -16
        static let fontSize: CGFloat = 18
    }
    
    enum SearchBarSizing {
        static let top: CGFloat = 19
        static let leading: CGFloat = 16
        static let trailing: CGFloat = -16
        static let bottom: CGFloat = -22
    }
    
    enum Sizing {
        static let scrollSpacing: CGFloat = 30
    }
    
    enum FontSize {
        static let label: CGFloat = 18
    }
}
