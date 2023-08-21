//
//  viewModel.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 11.08.23.
//

import Foundation
import UIKit

class HomeViewModel {
    
    private let apiManager = APIManager()
    var filmsData: [Films] = []
    
    var reloadData: (() -> Void)?
    func fetchFilmsNowShowing() {
        apiManager.fetchData(modelType: APIModel.self) { result in
            switch result {
            case .success(let apiModel):
//                self.filmsData = apiModel.films
                if let films = apiModel.films {
                                    self.filmsData = films
                                }
                self.reloadData?()
                print(apiModel)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

}


