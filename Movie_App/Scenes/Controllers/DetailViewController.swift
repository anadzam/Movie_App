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
        movieTitle.font = .boldSystemFont(ofSize: 20)
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        return movieTitle
    }()
    
    private let ratingLabel: UILabel = {
        
        let ratingLabel = UILabel()
        ratingLabel.textColor = Constants.Colors.neutral_lighter_grey
        ratingLabel.backgroundColor = Constants.Colors.neutral_darkest_grey
        ratingLabel.textAlignment = .center
        ratingLabel.font = .systemFont(ofSize: 14)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let finalString = NSAttributedString.attributedString(withIconNamed: "ratingIcon", text: "7.9")
        ratingLabel.attributedText = finalString
        ratingLabel.layer.cornerRadius = 14
        ratingLabel.layer.masksToBounds = true
        
        return ratingLabel
    }()
    
    
    
    private let genreLabel: UILabel = {
        let genreLabel = UILabel()
        genreLabel.textColor = Constants.Colors.neutral_lighter_grey
        genreLabel.backgroundColor = Constants.Colors.neutral_darkest_grey
        genreLabel.textAlignment = .center
        genreLabel.font = .systemFont(ofSize: 14)
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.text = "Romance"
        genreLabel.layer.cornerRadius = 14
        genreLabel.layer.masksToBounds = true
        
        return genreLabel
    }()
    
    private let movieDuration: UILabel = {
        let movieDuration = UILabel()
        movieDuration.textColor = Constants.Colors.neutral_lighter_grey
        movieDuration.backgroundColor = Constants.Colors.neutral_darkest_grey
        movieDuration.textAlignment = .center
        movieDuration.font = .systemFont(ofSize: 14)
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
        movieDuration.layer.cornerRadius = 14
        movieDuration.layer.masksToBounds = true
        
        return movieDuration
    }()
    
    private let movieYear: UILabel = {
        let movieYear = UILabel()
        movieYear.text = "2007"
        movieYear.textColor =  Constants.Colors.neutral_lighter_grey
        movieYear.backgroundColor = Constants.Colors.neutral_darkest_grey
        movieYear.textAlignment = .center
        movieYear.font = .systemFont(ofSize: 14)
        movieYear.translatesAutoresizingMaskIntoConstraints = false
        movieYear.layer.cornerRadius = 14
        movieYear.layer.masksToBounds = true
        
        return movieYear
    }()
    
    private let aboutMovieLabel: UILabel = {
        let aboutMovieLabel = UILabel()
        aboutMovieLabel.text = "About movie"
        aboutMovieLabel.textColor =  Constants.Colors.Neutral_Whisper
        aboutMovieLabel.textAlignment = .left
        aboutMovieLabel.font = .boldSystemFont(ofSize: 16)
        aboutMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return aboutMovieLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = """
        Thirteen-year-old fledgling writer Briony Tallis irrevocably changes the course of several lives when she accuses her older sister's lover of a crime he did not commit.
        """
        descriptionLabel.textColor =  Constants.Colors.neutral_lighter_grey
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        
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
    
    
    
    private let favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        favoriteButton.setImage(UIImage(named: "favoritesButton"), for: .normal)
        favoriteButton.imageView?.contentMode = .scaleAspectFill
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        //        favoritesButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return favoriteButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.neutral_black
        setUpSubviews()
        setUpNavBar()
        setUpConstraints()
        
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
            movieTitle.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 26),
            movieTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            movieTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -145),
        ])
    }
    
    private func setUpFavoriteButtonConstraints() {
        NSLayoutConstraint.activate([
            favoriteButton.centerYAnchor.constraint(equalTo: movieTitle.centerYAnchor),
            favoriteButton.widthAnchor.constraint(equalToConstant: 50),
            favoriteButton.heightAnchor.constraint(equalToConstant: 50),
            favoriteButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func setUpRatingLabelConstraints() {
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 12),
            ratingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            ratingLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 56),
            ratingLabel.heightAnchor.constraint(equalToConstant: 26)
            
        ])
    }
    
    private func setUpGenreLabelConstraints() {
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 12),
            genreLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 8),
            genreLabel.widthAnchor.constraint(equalToConstant: 89),
            genreLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
    
    private func setUpMovieDurationConstraints() {
        NSLayoutConstraint.activate([
            movieDuration.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 12),
            movieDuration.leadingAnchor.constraint(equalTo: genreLabel.trailingAnchor, constant: 8),
            movieDuration.widthAnchor.constraint(equalToConstant: 91),
            movieDuration.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
    
    private func setUpMovieYearConstraints() {
        NSLayoutConstraint.activate([
            movieYear.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 12),
            movieYear.leadingAnchor.constraint(equalTo: movieDuration.trailingAnchor, constant: 8),
            movieYear.widthAnchor.constraint(equalToConstant: 55),
            movieYear.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
    
    private func setUpaboutMovieLabelConstraints() {
        NSLayoutConstraint.activate([
            aboutMovieLabel.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 64),
            aboutMovieLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            aboutMovieLabel.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
    
    private func setUpDescriptionConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: aboutMovieLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func setUpTrailerButtonConstraints() {
        NSLayoutConstraint.activate([
            trailerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 252),
            trailerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            trailerButton.bottomAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: -20),
           
        ])
    }
    
}

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
