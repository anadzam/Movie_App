//
//  SearchBar+Extensions.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 18.07.23.
//

import Foundation
import UIKit
extension SearchBar {
    
    enum Color {
        static let labelFont: UIFont = .systemFont(ofSize: 8)
        static let placeholderColor = UIColor(hex: 0xC7C7C7)
        static let bubbleColor = UIColor(hex: 0xF1F1F1)
        static let textColor = UIColor(hex: 0x191919)
        static let failedTextColor = UIColor(hex: 0x676767)
        
    }
    enum SearchBarAttribute {
        static let placeholder: String = "Search"
        static let cancelButtonTitle: String = "cancel"
    }
    enum SearchBarFonts {
        static let clearButtonFontSize: CGFloat = 10
        static let placeholderFontSize: CGFloat = 16
    
    }
    
    enum SearchBarSizing {
        static let widthPadding: CGFloat = 44
        static let heightPadding: CGFloat = 50
        static let cornerRadius: CGFloat = 18
        static let leading: CGFloat = 2
        static let trailing: CGFloat = 44
        static let placeholderLeading: CGFloat = 44
        static let height: CGFloat = 36
    }
    
    enum ContainerViewSizing {
        static let height: CGFloat = 36
    }
    
    enum FilterButtonSizing {
        static let leading: CGFloat = 8
        static let height: CGFloat = 36
    }
    enum SearchIconSizing {
        static let leading: CGFloat = 24
        static let trailing: CGFloat = -6
        static let width: CGFloat = 14
        static let height: CGFloat = 14
    }
    
    enum CollectionViewSizing {
        static let widthPadding: CGFloat = 50
        static let heightPadding: CGFloat = 21
        static let height: CGFloat = 21
        static let leading: CGFloat = 4
        static let trailing: CGFloat = 20
      
    }
    enum ClearButtonSizing {
        static let heigth: CGFloat = 18
        static let width: CGFloat = 36
        static let leading: CGFloat = 5
    }
}
