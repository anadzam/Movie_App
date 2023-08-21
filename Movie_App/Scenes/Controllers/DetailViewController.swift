//
//  DetailViewController.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 18.07.23.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let moviePoster: UIImageView = {
        let moviePoster = UIImageView()
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        moviePoster.image = UIImage(assetIdentifier: Constants.AssetIdentifier.moviePoster)
        return moviePoster
    }()
    
    private let movieTitle: UILabel = {
        let movieTitle = UILabel()
        movieTitle.text = "The Atonement"
        movieTitle.textColor = .white
        movieTitle.textAlignment = .left
        movieTitle.font = UIFont.customFont(.bold, size: FontSize.movieTitle)
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        return movieTitle
    }()
    
    private let ratingLabel: UILabel = {
        
        let ratingLabel = UILabel()
        ratingLabel.textColor = Constants.Colors.neutral_lighter_grey
        ratingLabel.backgroundColor = Constants.Colors.neutral_darkest_grey
        ratingLabel.textAlignment = .center
        ratingLabel.font = UIFont.customFont(.medium, size: FontSize.ratingLabel)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let finalString = NSAttributedString.attributedString(withIconNamed: "ratingIcon", text: "7.9")
        ratingLabel.attributedText = finalString
        ratingLabel.layer.cornerRadius = RatingLabelSizing.cornerRadius
        ratingLabel.layer.masksToBounds = true
        
        return ratingLabel
    }()
    
    
    
    private let genreLabel: UILabel = {
        let genreLabel = UILabel()
        genreLabel.textColor = Constants.Colors.neutral_lighter_grey
        genreLabel.backgroundColor = Constants.Colors.neutral_darkest_grey
        genreLabel.textAlignment = .center
        genreLabel.font = UIFont.customFont(.medium, size: FontSize.genreLabel)
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.text = "Romance"
        genreLabel.layer.cornerRadius = GenreLabelSizing.cornerRadius
        genreLabel.layer.masksToBounds = true
        
        return genreLabel
    }()
    
    private let movieDuration: UILabel = {
        let movieDuration = UILabel()
        movieDuration.textColor = Constants.Colors.neutral_lighter_grey
        movieDuration.backgroundColor = Constants.Colors.neutral_darkest_grey
        movieDuration.textAlignment = .center
        movieDuration.font = UIFont.customFont(.medium, size: FontSize.movieDuration)
        movieDuration.translatesAutoresizingMaskIntoConstraints = false
        
        
        let iconAttachment = NSTextAttachment()
        iconAttachment.image = UIImage(named: "clock")
        let iconAttachmentString = NSAttributedString(attachment: iconAttachment)
        
        let textString = NSAttributedString(string: "1h 50m")
        
        if let imageWidth = iconAttachment.image?.size.width, let imageHeight = iconAttachment.image?.size.height {
            iconAttachment.bounds = CGRectMake(0.0, -3.0, imageWidth, imageHeight)
        } else {
            print("Error finding icon image")
        }
        
        
        
        let finalString = NSMutableAttributedString()
        finalString.append(iconAttachmentString)
        finalString.append(NSAttributedString(string: " "))
        finalString.append(textString)
        
        movieDuration.attributedText = finalString
        movieDuration.layer.cornerRadius = MovieDurationLabelSizing.cornerRadius
        movieDuration.layer.masksToBounds = true
        
        return movieDuration
    }()
    
    private let movieYear: UILabel = {
        let movieYear = UILabel()
        movieYear.text = "2007"
        movieYear.textColor =  Constants.Colors.neutral_lighter_grey
        movieYear.backgroundColor = Constants.Colors.neutral_darkest_grey
        movieYear.textAlignment = .center
        movieYear.font = UIFont.customFont(.medium, size: FontSize.movieYear)
        movieYear.translatesAutoresizingMaskIntoConstraints = false
        movieYear.layer.cornerRadius = MovieYearLabelSizing.cornerRadius
        movieYear.layer.masksToBounds = true
        
        return movieYear
    }()
    
    private let aboutMovieLabel: UILabel = {
        let aboutMovieLabel = UILabel()
        aboutMovieLabel.text = "About movie"
        aboutMovieLabel.textColor =  Constants.Colors.Neutral_Whisper
        aboutMovieLabel.textAlignment = .left
        aboutMovieLabel.font = UIFont.customFont(.semiBold, size: FontSize.aboutMovieLabel)
        aboutMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return aboutMovieLabel
    }()
    
    private let descriptionLabel: UITextView = {
        let descriptionLabel = UITextView()
        descriptionLabel.text = """
Thirteen-year-old fledgling writer Briony Tallis irrevocably changes the course of several lives when she accuses her older sister's lover of a crime he did not commit.
"""
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.textColor =  Constants.Colors.neutral_lighter_grey
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = UIFont.customFont(.medium, size: FontSize.descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.isEditable = false
//        descriptionLabel.numberOfLines = .zero
        
        return descriptionLabel
    }()
    
    //Commented since it's optional
    
    private let trailerButton: UIButton = {
        let trailerButton = UIButton()
        trailerButton.translatesAutoresizingMaskIntoConstraints = false
        trailerButton.setImage(UIImage(named: Constants.AssetIdentifier.trailerButton.rawValue), for: .normal)
        //        trailerButton.addTarget(self(), action: #selector(<#T##@objc method#>), for: .touchUpInside)
        return trailerButton
    }()
    
    
    
    private lazy var favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        favoriteButton.setImage(UIImage(named: Constants.AssetIdentifier.bigFavoritesButton.rawValue), for: .normal)
        favoriteButton.imageView?.contentMode = .scaleAspectFill
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.addTarget(self, action: #selector(detailsFavoriteButtonTapped), for: .touchUpInside)
        return favoriteButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.neutral_black
        setUpSubviews()
        setUpNavBar()
        setUpConstraints()
        
    }
    
    @objc private func detailsFavoriteButtonTapped() {
        favoriteButton.isSelected.toggle()
        let imageName = favoriteButton.isSelected ? Constants.AssetIdentifier.bigSelectedFavoritesButton : Constants.AssetIdentifier.bigFavoritesButton
        let image = UIImage(assetIdentifier: imageName)
        favoriteButton.setImage(image, for: .normal)
    }
    
    //MARK: - Set up Navigation Bar
    private func setUpNavBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.title = "Details"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    //MARK: - Set up subviews
    
    private func setUpSubviews() {
        view.addSubview(moviePoster)
        view.addSubview(movieTitle)
        view.addSubview(favoriteButton)
        view.addSubview(ratingLabel)
        view.addSubview(genreLabel)
        view.addSubview(movieDuration)
        view.addSubview(movieYear)
        view.addSubview(aboutMovieLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(trailerButton)
    }
    
    
    //MARK: - Set Up Constraints
    
    private func setUpConstraints() {
        setUpMoviePosterConstraints()
        setUpMovieTitleConstraints()
        setUpFavoriteButtonConstraints()
        setUpRatingLabelConstraints()
        setUpGenreLabelConstraints()
        setUpMovieDurationConstraints()
        setUpMovieYearConstraints()
        setUpaboutMovieLabelConstraints()
        setUpDescriptionConstraints()
        setUpTrailerButtonConstraints()
    }
    
    
    private func setUpMoviePosterConstraints() {
        NSLayoutConstraint.activate([
            moviePoster.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviePoster.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            moviePoster.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
           
        ])
    }
    
    private func setUpMovieTitleConstraints() {
        NSLayoutConstraint.activate([
            movieTitle.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: MovieTitleSizing.top),
            movieTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: MovieTitleSizing.leading),
            movieTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: MovieTitleSizing.trailing),
        ])
    }
    
    private func setUpFavoriteButtonConstraints() {
        NSLayoutConstraint.activate([
            favoriteButton.centerYAnchor.constraint(equalTo: movieTitle.centerYAnchor),
            favoriteButton.widthAnchor.constraint(equalToConstant: FavoriteButtonSizing.width),
            favoriteButton.heightAnchor.constraint(equalToConstant: FavoriteButtonSizing.height),
            favoriteButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: FavoriteButtonSizing.trailing),
        ])
    }
    
    private func setUpRatingLabelConstraints() {
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: RatingLabelSizing.top),
            ratingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: RatingLabelSizing.leading),
            ratingLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: RatingLabelSizing.width),
            ratingLabel.heightAnchor.constraint(equalToConstant: RatingLabelSizing.height)
        ])
    }
    
    private func setUpGenreLabelConstraints() {
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: GenreLabelSizing.top),
            genreLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: GenreLabelSizing.leading),
            genreLabel.widthAnchor.constraint(equalToConstant: GenreLabelSizing.width),
            genreLabel.heightAnchor.constraint(equalToConstant: GenreLabelSizing.height)
        ])
    }
    
    private func setUpMovieDurationConstraints() {
        NSLayoutConstraint.activate([
            movieDuration.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: MovieDurationLabelSizing.top),
            movieDuration.leadingAnchor.constraint(equalTo: genreLabel.trailingAnchor, constant: MovieDurationLabelSizing.leading),
            movieDuration.widthAnchor.constraint(equalToConstant: MovieDurationLabelSizing.width),
            movieDuration.heightAnchor.constraint(equalToConstant: MovieDurationLabelSizing.height)
        ])
    }
    
    private func setUpMovieYearConstraints() {
        NSLayoutConstraint.activate([
            movieYear.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: MovieYearLabelSizing.top),
            movieYear.leadingAnchor.constraint(equalTo: movieDuration.trailingAnchor, constant: MovieYearLabelSizing.leading),
            movieYear.widthAnchor.constraint(equalToConstant: MovieYearLabelSizing.width),
            movieYear.heightAnchor.constraint(equalToConstant: MovieYearLabelSizing.height)
        ])
    }
    
    private func setUpaboutMovieLabelConstraints() {
        NSLayoutConstraint.activate([
            aboutMovieLabel.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: AboutMovieLabelSizing.top),
            aboutMovieLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AboutMovieLabelSizing.leading),
            aboutMovieLabel.heightAnchor.constraint(equalToConstant: AboutMovieLabelSizing.heigth)
        ])
    }
    
    private func setUpDescriptionConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: aboutMovieLabel.bottomAnchor, constant: DescriptionLabelSizing.top),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: DescriptionLabelSizing.leading),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: DescriptionLabelSizing.trailing),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: DescriptionLabelSizing.bottom)
        ])
    }
    
    private func setUpTrailerButtonConstraints() {
        NSLayoutConstraint.activate([
            trailerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: TrailingButtonSizing.leading),
            trailerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: TrailingButtonSizing.trailing),
            trailerButton.bottomAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: TrailingButtonSizing.bottom),
        ])
    }
}

//MARK: - NSAttributedString

extension NSAttributedString {
    static func attributedString(withIconNamed iconName: String, text: String) -> NSAttributedString {
        let iconAttachment = NSTextAttachment()
        iconAttachment.image = UIImage(named: iconName)
        let iconAttachmentString = NSAttributedString(attachment: iconAttachment)
        
        let textString = NSAttributedString(string: text)
        
        let finalString = NSMutableAttributedString()
        finalString.append(iconAttachmentString)
        finalString.append(NSAttributedString(string: " "))
        finalString.append(textString)
        
        return finalString
    }
}

