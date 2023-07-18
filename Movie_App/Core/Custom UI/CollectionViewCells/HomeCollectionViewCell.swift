//
//  homeCollectionViewCell.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 18.07.23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "homeCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(assetIdentifier: Constants.AssetIdentifier.movieImage)
        return imageView
    }()
    
    private let genreLabel: UILabel = {
        let genreLabel = UILabel()
        genreLabel.layer.cornerRadius = 12
        genreLabel.layer.masksToBounds = true
        genreLabel.backgroundColor = Constants.Colors.yellow_primary
        genreLabel.text = "Comedy"
        genreLabel.font = .boldSystemFont(ofSize: 10)
        genreLabel.textAlignment = .center
        genreLabel.numberOfLines = 0
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        return genreLabel
    }()
    
    private let movieTitle: UILabel = {
        let movieTitle = UILabel()
        movieTitle.text = "The Boss Baby"
        movieTitle.font = .boldSystemFont(ofSize: 14)
        movieTitle.textColor = .white
        movieTitle.textAlignment = .left
        movieTitle.numberOfLines = 0
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        return movieTitle
    }()
    
    private let movieYearLabel: UILabel = {
        let movieTitle = UILabel()
        movieTitle.text = "2017"
        movieTitle.font = .systemFont(ofSize: 12)
        movieTitle.textColor = Constants.Colors.neutral_grey
        movieTitle.textAlignment = .center
        movieTitle.numberOfLines = 0
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        return movieTitle
    }()
    
    private let favoritesButton: UIButton = {
        let favoritesButton = UIButton()
        favoritesButton.setImage(UIImage(named: Constants.AssetIdentifier.favoritesButton.rawValue), for: .normal)
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
//        favoritesButton.addTarget(self, action: #selector(addToFavorites), for: .touchUpInside)
        return favoritesButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .clear
        contentView.addSubview(imageView)
        contentView.addSubview(genreLabel)
        contentView.addSubview(movieTitle)
        contentView.addSubview(movieYearLabel)
        contentView.addSubview(favoritesButton)
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc func addToFavorites() {
//
//    }
//
    private func setUpConstraints() {
        setUpImageViewConstraints()
        setUpGenreLabelConstraints()
        setUpMovieTitleConstraints()
        setUpMovieYearConstraints()
        setUpFavoritesButtonConstraints()
    }
    
    private func setUpImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -43),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    private func setUpGenreLabelConstraints() {
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            genreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -238),
            genreLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 58),
            genreLabel.heightAnchor.constraint(equalToConstant: 21),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
    }
    
    private func setUpMovieTitleConstraints() {
        NSLayoutConstraint.activate([
            movieTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            movieTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            movieTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            movieTitle.heightAnchor.constraint(equalToConstant: 23),
            movieTitle.widthAnchor.constraint(equalToConstant: 127)
        ])
    }
    
    private func setUpMovieYearConstraints() {
        NSLayoutConstraint.activate([
            movieYearLabel.topAnchor.constraint(equalTo: movieTitle.bottomAnchor),
            movieYearLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            movieYearLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
        ])
    }
    
    private func setUpFavoritesButtonConstraints() {
        NSLayoutConstraint.activate([
            favoritesButton.centerYAnchor.constraint(equalTo: movieTitle.centerYAnchor),
            favoritesButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 19.5),
            favoritesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4.05)
        ])
    }
    
}
