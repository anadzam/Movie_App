//
//  FavoriteViewController.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 17.07.23.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    private let noMoviesImage: UIImageView = {
        let noMoviesImage = UIImageView()
        noMoviesImage.translatesAutoresizingMaskIntoConstraints = false
        noMoviesImage.image = UIImage(assetIdentifier: Constants.AssetIdentifier.noFavorites)
        return noMoviesImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.neutral_black
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.title = "Favorite movies"
        

        view.addSubview(noMoviesImage)
        setUpConstraints()
        
      
    }

    //MARK: - Set Up Constraints
    private func setUpConstraints() {
        setUpImageViewConstraints()
    }
    
    private func setUpImageViewConstraints() {
        NSLayoutConstraint.activate([
            noMoviesImage.widthAnchor.constraint(equalToConstant: 179),
            noMoviesImage.heightAnchor.constraint(equalToConstant: 149),
            noMoviesImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            noMoviesImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    
}
