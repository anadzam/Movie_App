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
        return imageView
    }()
    
    private let genreLabel: UILabel = {
        let genreLabel = UILabel()
        genreLabel.layer.cornerRadius = GenreLabelSizing.cornerRadius
        genreLabel.layer.masksToBounds = true
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.backgroundColor = Constants.Colors.yellow_primary
        genreLabel.font = .boldSystemFont(ofSize: CellFontSize.genreFontSize)
        genreLabel.numberOfLines = 1
        genreLabel.textAlignment = .center
      
        genreLabel.sizeToFit()
        
        
        return genreLabel
    }()
    
    private let movieTitle: UILabel = {
        let movieTitle = UILabel()
        movieTitle.font = .boldSystemFont(ofSize: CellFontSize.movieTitleFontSize)
        movieTitle.textColor = .white
        movieTitle.textAlignment = .left
        movieTitle.numberOfLines = .zero
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        return movieTitle
    }()
    
    private let movieYearLabel: UILabel = {
        let movieYearLabel = UILabel()
        movieYearLabel.font = .systemFont(ofSize: CellFontSize.movieLabelFontSize)
        movieYearLabel.textColor = Constants.Colors.neutral_grey
        movieYearLabel.textAlignment = .center
        movieYearLabel.numberOfLines = .zero
        movieYearLabel.translatesAutoresizingMaskIntoConstraints = false
        return         movieYearLabel
    }()
    
    private lazy var favoritesButton: UIButton = {
        let favoritesButton = UIButton()
        favoritesButton.setImage(UIImage(named: Constants.AssetIdentifier.favoritesButton.rawValue), for: .normal)
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
        favoritesButton.imageView?.contentMode = .scaleAspectFit
        favoritesButton.addTarget(self, action: #selector(addToFavorites), for: .touchUpInside)
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
    
    @objc func addToFavorites() {
        favoritesButton.isSelected.toggle()
        
        
        let imageName = favoritesButton.isSelected ? Constants.AssetIdentifier.selectedFavoritesButton : Constants.AssetIdentifier.favoritesButton
        let image = UIImage(assetIdentifier: imageName)
        
        favoritesButton.setImage(image, for: .normal)
        
        
    }
    
    func configure(with movieModel: MovieModel) {
        imageView.image = UIImage(named: movieModel.imageView)
        genreLabel.text = movieModel.genreLabel
        genreLabel.sizeToFit()
     
        movieTitle.text = movieModel.moviewTitle
        movieYearLabel.text = movieModel.movieYearLabel
        
    }
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
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: ImageViewSizing.bottom),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    private func setUpGenreLabelConstraints() {
       
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: GenreLabelSizing.top),
            genreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: GenreLabelSizing.bottom),
            genreLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: GenreLabelSizing.width),
           
            genreLabel.heightAnchor.constraint(equalToConstant: GenreLabelSizing.height),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: GenreLabelSizing.trailing)
        ])

    }

    
    private func setUpMovieTitleConstraints() {
        NSLayoutConstraint.activate([
            movieTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: MovieTitleSizing.top),
            movieTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: MovieTitleSizing.leading),
            movieTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: MovieTitleSizing.bottom),
            movieTitle.heightAnchor.constraint(equalToConstant: MovieTitleSizing.height),
            movieTitle.widthAnchor.constraint(equalToConstant: MovieTitleSizing.width)
        ])
    }
    
    private func setUpMovieYearConstraints() {
        NSLayoutConstraint.activate([
            movieYearLabel.topAnchor.constraint(equalTo: movieTitle.bottomAnchor),
            movieYearLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            movieYearLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: MovieYearLabelSizing.leading),
        ])
    }
    
    private func setUpFavoritesButtonConstraints() {
        NSLayoutConstraint.activate([
            favoritesButton.centerYAnchor.constraint(equalTo: movieTitle.centerYAnchor),
            favoritesButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: FavoriteButtonSizing.bottom),
            favoritesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: FavoriteButtonSizing.trailing),
            favoritesButton.widthAnchor.constraint(equalToConstant: FavoriteButtonSizing.width)
        ])
    }
    
}
