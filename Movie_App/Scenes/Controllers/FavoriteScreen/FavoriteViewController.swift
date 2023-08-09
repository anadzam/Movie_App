//
//  FavoriteViewController.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 17.07.23.
//

import UIKit

class FavoriteViewController: UIViewController {
    private var favoriteCollectionView: UICollectionView!
    private let viewModel = FavoiteModel()
    let errorStateView = ErrorStateView()
    let emptyStateView = EmptyStateView()
    let loadingStateView = LoadingStateView()
    
    
    
    private func configureFavoriteCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: CollectionViewSizing.itemWidth, height: CollectionViewSizing.itemHeight)
        layout.scrollDirection = .vertical
        
        
        favoriteCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        favoriteCollectionView.backgroundColor = .clear
        favoriteCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        favoriteCollectionView.dataSource = self
        favoriteCollectionView.delegate = self
        
        view.addSubview(favoriteCollectionView)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.neutral_black
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.title = FavoriteViewStrings.navigationItemTitle
        
        //for testin state views
        //                view.addSubview(errorStateView)
        //                view.addSubview(emptyStateView)
        //        view.addSubview(loadingStateView)
        //        setUpLoadingViewConstraints()
        //                setUpErrorViewConstraints()
        //                setUpEmptyViewConstraints()
        //
        
        configureFavoriteCollectionView()
        setUpConstraints()
        
    }
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //        loadingStateView.startSpinning()
    //    }
    
    //MARK: - Set Up Constraints
    private func setUpConstraints() {
        setUpFavoritesCollectionConstraints()
    }
    
    private func setUpLoadingViewConstraints() {
        loadingStateView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingStateView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loadingStateView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
            
        ])
    }
    //for testing
    private func setUpErrorViewConstraints() {
        errorStateView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorStateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            errorStateView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            errorStateView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            errorStateView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    //    for testing
    private func setUpEmptyViewConstraints() {
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emptyStateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            emptyStateView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            emptyStateView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            emptyStateView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    private func setUpFavoritesCollectionConstraints() {
        favoriteCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoriteCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CollectionViewSizing.leading),
            favoriteCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CollectionViewSizing.trailing),
            favoriteCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: CollectionViewSizing.bottom)
        ])
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        cell.layer.masksToBounds = true
        cell.configure(with: viewModel.movieModel[indexPath.row])
        return cell
    }
}


extension FavoriteViewController {
    enum FavoriteViewStrings {
        static let navigationItemTitle: String = "Favorite movies"
    }
    enum CollectionViewSizing {
        static let itemWidth: CGFloat = 164
        static let itemHeight: CGFloat = 269
        
        static let leading: CGFloat = 16
        static let trailing: CGFloat = -16
        static let bottom: CGFloat = -16
        
    }
}
