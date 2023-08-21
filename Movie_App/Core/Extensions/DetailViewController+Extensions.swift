//
//  DetailViewController+Extensions.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 01.08.23.
//

import Foundation
extension DetailViewController {
    enum FontSize {
        static let movieTitle: CGFloat = 20
        static let ratingLabel: CGFloat = 14
        static let genreLabel: CGFloat = 14
        static let movieDuration: CGFloat = 14
        static let movieYear: CGFloat = 14
        static let aboutMovieLabel: CGFloat = 16
        static let descriptionLabel: CGFloat = 14
    }
    
    enum MovieTitleSizing {
        static let fontSize: CGFloat = 20
        static let top: CGFloat = 26
        static let leading: CGFloat = 16
        static let trailing: CGFloat = -145
    }
    
    enum FavoriteButtonSizing {
        static let height: CGFloat = 50
        static let width: CGFloat = 50
        static let trailing: CGFloat = -16
    }
    enum RatingLabelSizing {
        static let fontSize: CGFloat = 14
        static let cornerRadius: CGFloat = 14
        static let top: CGFloat = 12
        static let leading: CGFloat = 16
        static let height: CGFloat = 26
        static let width: CGFloat = 56
    }
    
    enum GenreLabelSizing {
        static let fontSize: CGFloat = 14
        static let cornerRadius: CGFloat = 14
        static let top: CGFloat = 12
        static let leading: CGFloat = 8
        static let height: CGFloat = 26
        static let width: CGFloat = 89
    }
    
    
    enum MovieDurationLabelSizing {
        static let fontSize: CGFloat = 14
        static let cornerRadius: CGFloat = 14
        static let top: CGFloat = 12
        static let leading: CGFloat = 8
        static let height: CGFloat = 26
        static let width: CGFloat = 91
        
    }
    enum MovieYearLabelSizing {
        static let fontSize: CGFloat = 14
        static let cornerRadius: CGFloat = 14
        static let top: CGFloat = 12
        static let leading: CGFloat = 8
        static let height: CGFloat = 26
        static let width: CGFloat = 55
        
    }
    enum AboutMovieLabelSizing {
        static let fontSize: CGFloat = 16
        static let top: CGFloat = 64
        static let leading: CGFloat = 16
        static let heigth: CGFloat = 21
        
        
    }
    
    enum DescriptionLabelSizing {
        static let fontSize: CGFloat = 16
        static let top: CGFloat = 8
        static let leading: CGFloat = 16
        static let trailing: CGFloat = -16
        static let bottom: CGFloat = -50
        
    }
    enum TrailingButtonSizing {
        static let leading: CGFloat = 252
        static let bottom: CGFloat = -20
        static let trailing: CGFloat = -16
        
    }
}
