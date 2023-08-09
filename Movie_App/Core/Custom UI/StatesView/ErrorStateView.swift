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
        errorLabel.font = .boldSystemFont(ofSize: ErrorLabelSizing.font)
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = .zero
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
    private let errorDetailLabel: UILabel = {
        let errorDetailLabel = UILabel()
        errorDetailLabel.text = """
 internet connection or some
other server error
"""
        errorDetailLabel.textColor = Constants.Colors.Neutral_Whisper
        errorDetailLabel.font = .systemFont(ofSize: ErrorDetailLabelSizing.font)
        errorDetailLabel.textAlignment = .center
        errorDetailLabel.numberOfLines = 2
        errorDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorDetailLabel
    }()
    
    private let refreshButton: UIButton = {
        let refreshButton = UIButton()
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.layer.masksToBounds = true
        refreshButton.layer.cornerRadius = RefreshButtonSizing.radius
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
            icon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: IconSizing.top),
            icon.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: IconSizing.leading),
            icon.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: IconSizing.trailing),
        ])
        
    }
    
    private func setUpErrorLabelConstraints() {
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: ErrorLabelSizing.top),
            errorLabel.widthAnchor.constraint(equalToConstant: ErrorLabelSizing.width),
            errorLabel.heightAnchor.constraint(equalToConstant: ErrorLabelSizing.height),
            errorLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    private func setUpErrorDetailLabelConstraints() {
        NSLayoutConstraint.activate([
            errorDetailLabel.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: ErrorDetailLabelSizing.top),
            errorDetailLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: ErrorDetailLabelSizing.trailing),
            errorDetailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: ErrorDetailLabelSizing.leading),
            errorDetailLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    
    private func setUpRefreshButtonConstraints() {
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: errorDetailLabel.bottomAnchor, constant: RefreshButtonSizing.top),
            refreshButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: RefreshButtonSizing.trailing),
            refreshButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: RefreshButtonSizing.leading)
        ])
    }

    
}

 extension ErrorStateView {
    enum RefreshButtonSizing {
        static let radius: CGFloat = 16
        static let top: CGFloat = 110
        static let trailing: CGFloat = -120
        static let leading: CGFloat = 120
    }
    enum IconSizing {
        static let top: CGFloat = 229
        static let trailing: CGFloat = -150
        static let leading: CGFloat = 160
    }
    enum ErrorDetailLabelSizing {
        static let font: CGFloat = 16
        static let top: CGFloat = 23
        static let trailing: CGFloat = -64
        static let leading: CGFloat = 64
    }
    enum ErrorLabelSizing {
        static let font: CGFloat = 18
        static let top: CGFloat = 28
        static let width: CGFloat = 196
        static let height: CGFloat = 18
    }
    
}
