//
//  Constants.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 17.07.23.
//

import Foundation
import UIKit

enum Constants {
    
    enum AssetIdentifier: String {
        case launchLogo
        case home
        case favorites
        case selectedHome
        case selectedFavoirtes
        case movieImage
        case noFavorites
        case searchIcon
        case filterButton
        case moviePoster
        case clock
        case trailerButton
        case selectedFilter
        case selectedFavoritesButton
        case bigSelectedFavoritesButton
        case bigFavoritesButton
        case favoritesButton
        case errorIcon
        case refreshButton
        case emptyImage
    }
    enum Colors {
        static let yellow_primary = UIColor(hex: 0xF5C518)
        static let neutral_darkest_grey = UIColor(hex: 0x1C1C1C)
        static let neutral_black = UIColor(hex: 0x080808)
        static let neutral_grey = UIColor(hex: 0x808080)
        static let neutral_light_grey = UIColor(hex: 0xA5A5A5)
        static let neutral_lighter_grey = UIColor(hex: 0xCACACA)
        static let Neutral_Whisper = UIColor(hex: 0xEAEAEA)
    }
}
