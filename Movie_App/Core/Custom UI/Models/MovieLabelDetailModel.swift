//
//  MovieDetailModel.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 09.08.23.
//

import Foundation

struct MovieLabelDetailModel {
    let title: String
    let state: movieLabelState
    
    init(title: String, state: movieLabelState) {
        self.title = title
        self.state = state
    }
}

enum movieLabelState {
    case withIcon
    case withoutIcon
}
