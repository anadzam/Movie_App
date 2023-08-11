//
//  HomeCollectionViewCell+Extensions.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 01.08.23.
//

import Foundation
extension HomeCollectionViewCell {
    enum GenreLabelSizing {
        static let cornerRadius: CGFloat = 12
        static let top: CGFloat = 10
        static let bottom: CGFloat = -238
        static let width: CGFloat = 70
        static let height: CGFloat = 21
        static let trailing: CGFloat = -10
        
    }
    enum MovieTitleSizing {
        static let top: CGFloat = 4
        static let leading: CGFloat = 5
        static let bottom: CGFloat = -16
        static let width: CGFloat = 127
        static let height: CGFloat = 23
        
    }
    enum FavoriteButtonSizing {
        static let trailing: CGFloat = -4.05
        static let bottom: CGFloat = 19.5
        static let width: CGFloat = 21
        
        
    }
    enum MovieYearLabelSizing {
        static let leading: CGFloat = 5
    }
    
    enum CellFontSize {
        static let genreFontSize: CGFloat = 10
        static let movieLabelFontSize: CGFloat = 10
        static let movieTitleFontSize: CGFloat = 14
        static let movieYearLabelFontSize: CGFloat = 12
    }
    enum ImageViewSizing {
        static let bottom: CGFloat = -43
        
    }
    enum CellStrings {
        static let identifier: String = "homeCollectionViewCell"
        
    }
}
