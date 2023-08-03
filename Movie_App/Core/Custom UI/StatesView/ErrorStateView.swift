//
//  ErrorStateView.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 01.08.23.
//

import UIKit

class ErrorStateView: UIView {
    
    private let icon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(assetIdentifier: Constants.AssetIdentifier.errorIcon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    private let errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.text = "Data can’t be loaded"
        errorLabel.textColor = Constants.Colors.Neutral_Whisper
        errorLabel.font = .boldSystemFont(ofSize: 18)
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = .zero
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
    private let errorDetailLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.text = """
 internet connection or some
other server error
"""
        errorLabel.textColor = Constants.Colors.Neutral_Whisper
        errorLabel.font = .systemFont(ofSize: 16)
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 2
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
    private let refreshButton: UIButton = {
        let refreshButton = UIButton()
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.layer.masksToBounds = true
        refreshButton.layer.cornerRadius = 16
        refreshButton.setImage(UIImage(assetIdentifier: Constants.AssetIdentifier.refreshButton), for: .normal)
        
        return refreshButton
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(icon)
        addSubview(errorLabel)
        addSubview(errorDetailLabel)
        addSubview(refreshButton)
        setUpConstaint()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstaint() {
        setUpIconConstraints()
        setUpErrorLabelConstraints()
        setUpErrorDetailLabelConstraints()
        setUpRefreshButtonConstraints()
    }
    
    
    private func setUpIconConstraints() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 229),
           
            icon.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 160),
            icon.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -150),
        ])
        
    }
    
    private func setUpErrorLabelConstraints() {
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 28),
            errorLabel.widthAnchor.constraint(equalToConstant: 196),
            errorLabel.heightAnchor.constraint(equalToConstant: 18),
            errorLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    private func setUpErrorDetailLabelConstraints() {
        NSLayoutConstraint.activate([
            errorDetailLabel.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 23),
            errorDetailLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -64),
            errorDetailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 64),
            errorDetailLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    
    private func setUpRefreshButtonConstraints() {
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: errorDetailLabel.bottomAnchor, constant: 110),
            refreshButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -120),
            refreshButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 120)
        ])
    }

    
}
