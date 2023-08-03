//
//  EmptyStateView.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 01.08.23.
//

import UIKit

class EmptyStateView: UIView {
    
    private let noMoviesImage: UIImageView = {
        let noMoviesImage = UIImageView()
        noMoviesImage.translatesAutoresizingMaskIntoConstraints = false
        noMoviesImage.image = UIImage(assetIdentifier: Constants.AssetIdentifier.noFavorites)
        return noMoviesImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(noMoviesImage)
        setUpImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpImageViewConstraints() {
           NSLayoutConstraint.activate([
            noMoviesImage.widthAnchor.constraint(equalToConstant: EmptyStateViewSizing.imageViewWidth),
            noMoviesImage.heightAnchor.constraint(equalToConstant: EmptyStateViewSizing.imageViewHeight),
               noMoviesImage.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
               noMoviesImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
           ])
       }
}

extension EmptyStateView {
    enum EmptyStateViewSizing {
        static let imageViewWidth: CGFloat = 179
        static let imageViewHeight: CGFloat = 149
    }
}
