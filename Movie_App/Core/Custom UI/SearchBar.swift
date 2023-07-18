//
//  SearchBar.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 18.07.23.
//

import Foundation
import UIKit

class SearchBar: UIView {
    private lazy var searchBar = UITextField()
    private lazy var containerView = UIView()
    
    //MARK: - components
    
    private let placeHolder: UILabel = {
        let placeholder = UILabel()
        placeholder.text = "Search"
        placeholder.font = .systemFont(ofSize: 14)
        placeholder.sizeToFit()
        
        placeholder.textColor = Constants.Colors.neutral_light_grey
        
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        return placeholder
    }()
    
    private let searchIcon: UIImageView = {
        let searchIcon = UIImageView()
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        searchIcon.image = UIImage(assetIdentifier: Constants.AssetIdentifier.searchIcon)
        return searchIcon
    }()
    
    private let filterButton: UIButton = {
        let filterButton = UIButton()
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.setImage(UIImage(assetIdentifier: Constants.AssetIdentifier.filterButton), for: .normal)
        return filterButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        addSubview(containerView)
        containerView.addSubview(searchBar)
        containerView.addSubview(filterButton)
        searchBar.addSubview(searchIcon)
        searchBar.addSubview(placeHolder)
        setUpContainerView()
        setUpSearchBar()
        setUpConstraints()
        addPadding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func addPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 50))
        searchBar.leftView = paddingView
        searchBar.leftViewMode = .always

    }
    private func setUpSearchBar() {
        searchBar.layer.cornerRadius = 18
        searchBar.textColor = Constants.Colors.neutral_light_grey
        searchBar.backgroundColor = .clear
        searchBar.backgroundColor = Constants.Colors.neutral_darkest_grey
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.autocorrectionType = .no
        searchBar.clipsToBounds = true
        searchBar.delegate = self
        
    }
    
    private func setUpContainerView() {
        containerView.layer.cornerRadius = 18
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .clear
    }
    
    
    //MARK: - Set Up Constraints
    private func setUpConstraints() {
        setUpContainerViewConstraints()
        setUpSearchBarConstraints()
        setUpPlaceholderConstraints()
        setUpSearchIconConstraints()
        setUpFilterButtonConstraints()
    }
    
    private func setUpContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 36)
            
        ])
    }
    
    private func setUpSearchBarConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: containerView.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 2),
           
            searchBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -44),
            searchBar.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
        ])
    }
    
    private func setUpFilterButtonConstraints() {
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: containerView.topAnchor),
            filterButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 8),
            filterButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            filterButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            

        ])
    }
    private func setUpSearchIconConstraints() {
        NSLayoutConstraint.activate([
            searchIcon.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            searchIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            searchIcon.trailingAnchor.constraint(equalTo: placeHolder.leadingAnchor, constant: -6),
            searchIcon.widthAnchor.constraint(equalToConstant: 14),
            searchIcon.heightAnchor.constraint(equalToConstant: 14)
            
        ])
    }
    
    private func setUpPlaceholderConstraints() {
        NSLayoutConstraint.activate([
            placeHolder.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            placeHolder.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 44)
        ])
    }
}


//MARK: - UITextFieldDelegate
extension SearchBar: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        placeHolder.isHidden = true
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let searchText = searchBar.text, searchText.isEmpty {
                placeHolder.isHidden = false
            }
    }
    
}
