//
//  GenreCollectionViewCell.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 21.07.23.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GenreCell"
    
    var genreButton: UIButton = {
        let genreButton = UIButton()
        genreButton.translatesAutoresizingMaskIntoConstraints = false
        genreButton.setTitleColor(Constants.Colors.neutral_lighter_grey, for: .normal)
        genreButton.layer.cornerRadius = 10
        genreButton.titleLabel?.font = .systemFont(ofSize: 10)
        genreButton.layer.borderWidth = 1
        genreButton.titleLabel?.numberOfLines = 0
        genreButton.layer.borderColor = Constants.Colors.neutral_lighter_grey.cgColor
        //        genreButton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        return genreButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(genreButton)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            genreButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            genreButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            genreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            genreButton.heightAnchor.constraint(equalToConstant: 21) // Adjust the height as needed
        ])
    }
}


