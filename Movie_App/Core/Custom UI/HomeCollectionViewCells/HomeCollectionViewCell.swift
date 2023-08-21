//
//  homeCollectionViewCell.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 18.07.23.
//

import UIKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = CellStrings.identifier
    
    //MARK: - Components
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let genreLabel: UILabel = {
        let genreLabel = UILabel()
        genreLabel.layer.cornerRadius = GenreLabelSizing.cornerRadius
        genreLabel.layer.masksToBounds = true
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.backgroundColor = Constants.Colors.yellow_primary
        genreLabel.font = UIFont.customFont(.semiBold, size: CellFontSize.genreFontSize)
        genreLabel.numberOfLines = 1
        genreLabel.textAlignment = .center
        
        genreLabel.sizeToFit()
        
        return genreLabel
    }()
    
    private let movieTitle: UILabel = {
        let movieTitle = UILabel()
        movieTitle.font = UIFont.customFont(.medium, size: CellFontSize.movieTitleFontSize)
        movieTitle.textColor = .white
        movieTitle.textAlignment = .left
        movieTitle.numberOfLines = .zero
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        return movieTitle
    }()
    
    private let movieYearLabel: UILabel = {
        let movieYearLabel = UILabel()
        movieYearLabel.font = UIFont.customFont(.regular, size: CellFontSize.movieYearLabelFontSize)
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
        addAllSubviews()
        setUpConstraints()
        
    }
    
    private func addAllSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(genreLabel)
        contentView.addSubview(movieTitle)
        contentView.addSubview(movieYearLabel)
        contentView.addSubview(favoritesButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Add to favorites Button
    @objc func addToFavorites() {
        favoritesButton.isSelected.toggle()
        let imageName = favoritesButton.isSelected ? Constants.AssetIdentifier.selectedFavoritesButton : Constants.AssetIdentifier.favoritesButton
        let image = UIImage(assetIdentifier: imageName)
        favoritesButton.setImage(image, for: .normal)
    }

    
    func configure(with film: Films) {
        if let posters = film.images?.poster {
               if let firstPoster = posters["1"] { // Check if the "1" key exists
                   if let medium = firstPoster.medium, let filmImage = medium.film_image {
                       if let imageURL = URL(string: filmImage) {
                           imageView.sd_setImage(with: imageURL)
                       }
                   }
               } else if let emptyPoster = film.images?.emptyPoster, emptyPoster.isEmpty {
                   imageView.image = UIImage(named: Constants.AssetIdentifier.emptyImage.rawValue)
                   
               }
           }

        
       
        genreLabel.text = "comedy"
        genreLabel.sizeToFit()
        movieTitle.text = film.film_name
        if let releaseDate = film.release_dates?.first, let formattedDate = releaseDate.release_date {
               movieYearLabel.text = DateFormatter.formatCutomDate(from: formattedDate)
           } else {
               movieYearLabel.text = ""
           }
     }
   
    //MARK: - Set Up constraints
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


