//
//  GenreCollectionViewCell.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 21.07.23.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    
    static let identifier = CellStrings.identifier
    
    var genreButton: UIButton = {
        let genreButton = UIButton()
        genreButton.translatesAutoresizingMaskIntoConstraints = false
        genreButton.setTitleColor(Constants.Colors.neutral_lighter_grey, for: .normal)
        
        //        genreButton.textColor = Constants.Colors.neutral_lighter_grey
        
        genreButton.layer.cornerRadius = GenreButtonSizing.cornerRadius
        //        genreButton.textAlignment = .center
        genreButton.titleLabel?.font = GenreButtonSizing.font
        genreButton.layer.borderWidth = 1
        genreButton.titleLabel?.numberOfLines = .zero
        genreButton.backgroundColor = .clear
        genreButton.layer.borderColor = Constants.Colors.neutral_lighter_grey.cgColor
        genreButton.isUserInteractionEnabled = false
        
        //        genreButton.addTarget(self, action: #selector(genreButtonPressed), for: .touchUpInside)
        //        genreButton.isSelected = false
        return genreButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(genreButton)
        self.clipsToBounds = true
        //        self.sizeToFit()
        self.layer.cornerRadius = GenreButtonSizing.cornerRadius
        
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    @objc func genreButtonPressed() {
    //        genreButton.isSelected.toggle()
    //
    //        let buttonBackgroundColor = genreButton.isSelected ? Constants.Colors.yellow_primary : .clear
    //        let titleColor = genreButton.isSelected ? Constants.Colors.neutral_black : Constants.Colors.neutral_lighter_grey
    //        genreButton.setTitleColor(titleColor, for: .normal)
    //        genreButton.backgroundColor = buttonBackgroundColor
    //
    //    }
    
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            genreButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            genreButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            genreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}


//MARK: - GenreCollectionViewCell Extensions
extension GenreCollectionViewCell {
    enum GenreButtonSizing {
        static let cornerRadius: CGFloat = 10
        static let font: UIFont = UIFont.customFont(.medium, size: 10)
    }
    enum CellStrings {
        static let identifier: String = "GenreCell"
        
    }
}


