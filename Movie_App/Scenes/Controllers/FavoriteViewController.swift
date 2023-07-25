//
//  FavoriteViewController.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 17.07.23.
//

import UIKit

class FavoriteViewController: UIViewController {
    private var favoriteCollectionView: UICollectionView!
    
    
    private let noMoviesImage: UIImageView = {
        let noMoviesImage = UIImageView()
        noMoviesImage.translatesAutoresizingMaskIntoConstraints = false
        noMoviesImage.image = UIImage(assetIdentifier: Constants.AssetIdentifier.noFavorites)
        return noMoviesImage
    }()
    
    private func configureFavoriteCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 164, height: 269)
        layout.scrollDirection = .vertical
        
        
        //        favoriteCollectionView.dataSource = self
        //        favoriteCollectionView.delegate = self
        favoriteCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favoriteCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        favoriteCollectionView.backgroundColor = .clear
        //        favoriteCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        
        
        view.addSubview(favoriteCollectionView)
        
        
    }
    
    
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
//        setUpFavoritesCollectionConstraints()
    }
    
    private func setUpImageViewConstraints() {
        NSLayoutConstraint.activate([
            noMoviesImage.widthAnchor.constraint(equalToConstant: 179),
            noMoviesImage.heightAnchor.constraint(equalToConstant: 149),
            noMoviesImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            noMoviesImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    private func setUpFavoritesCollectionConstraints() {
        NSLayoutConstraint.activate([
            favoriteCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoriteCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            favoriteCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            favoriteCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16)
        ])
        
    }
    
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////
//    }
//
//
//}
