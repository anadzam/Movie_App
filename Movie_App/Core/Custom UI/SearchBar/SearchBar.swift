//
//  SearchBar.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 18.07.23.
//

import Foundation
import UIKit

protocol FilterButtonDelegate: AnyObject {
    func filterButtonTapped(isSelected: Bool)
}
class SearchBar: UIView {
    private lazy var searchBar = UITextField()
    private lazy var containerView = UIView()
     var genreCollectionView: UICollectionView!
    weak var filterButtonDelegate: FilterButtonDelegate?
    
    var isGenreCollectionViewVisible: Bool = false
    let genres = ["Action", "Comedy", "Drama", "Romance", "Horror", "Crime", "Crime", "Crime", "Crime"]
    
    
    //MARK: - components
    private let placeHolder: UILabel = {
        let placeholder = UILabel()
        placeholder.text = SearchBarAttributes.placeholder
        placeholder.font = .systemFont(ofSize: SearchBarAttributes.placeholderFontSize)
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
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        filterButton.isSelected = false
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
        configureGenreCollectionView()
        
        setUpConstraints()
        addPadding()

        genreCollectionView.isHidden = !isGenreCollectionViewVisible
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Filter button tapped
    @objc private func filterButtonTapped() {
        filterButton.isSelected.toggle()
        isGenreCollectionViewVisible = filterButton.isSelected
        genreCollectionView.isHidden = !isGenreCollectionViewVisible
        
        let imageName = filterButton.isSelected ? Constants.AssetIdentifier.selectedFilter : Constants.AssetIdentifier.filterButton
        let image = UIImage(assetIdentifier: imageName)
        filterButton.setImage(image, for: .normal)
        
        filterButtonDelegate?.filterButtonTapped(isSelected: filterButton.isSelected)
        
    }
    
    private func configureGenreCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 50, height: 21)
        
       
        genreCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        genreCollectionView.backgroundColor = .clear
        genreCollectionView.register(GenreCollectionViewCell.self,
                                     forCellWithReuseIdentifier: GenreCollectionViewCell.identifier)
         genreCollectionView.showsHorizontalScrollIndicator = false
        genreCollectionView.showsVerticalScrollIndicator = false
        genreCollectionView.dataSource = self
        genreCollectionView.delegate = self
        genreCollectionView.isScrollEnabled = true
        genreCollectionView.isUserInteractionEnabled = true
        genreCollectionView.alwaysBounceVertical = true
        
        //consider
        addSubview(genreCollectionView)
    }
    
    private func addPadding() {
        let paddingView = UIView(frame: CGRect(x: .zero,
                                               y: .zero,
                                               width: SearchBarSizing.widthPadding,
                                               height: SearchBarSizing.heightPadding)
        )
        searchBar.leftView = paddingView
        searchBar.leftViewMode = .always
        
    }
    private func setUpSearchBar() {
        searchBar.layer.cornerRadius = SearchBarSizing.cornerRadius
        searchBar.textColor = Constants.Colors.neutral_light_grey
        searchBar.backgroundColor = .clear
        searchBar.backgroundColor = Constants.Colors.neutral_darkest_grey
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.autocorrectionType = .no
        searchBar.clipsToBounds = true
        searchBar.delegate = self
        
    }
    
    private func setUpContainerView() {
        containerView.layer.cornerRadius = SearchBarSizing.cornerRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .clear
        containerView.isUserInteractionEnabled = true
    }
    
    
    //MARK: - Set Up Constraints
    private func setUpConstraints() {
        setUpContainerViewConstraints()
        setUpSearchBarConstraints()
        setUpPlaceholderConstraints()
        setUpSearchIconConstraints()
        setUpFilterButtonConstraints()
        setUCollectionViewConstraints()
    }
    
    private func setUpContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            //            containerView.heightAnchor.constraint(equalToConstant: 65)
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: ContainerViewSizing.height)
            
        ])
    }
    
    private func setUpSearchBarConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: containerView.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: SearchBarSizing.leading),
            
            searchBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -SearchBarSizing.trailing),
            searchBar.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
            
        ])
    }
    
    private func setUpFilterButtonConstraints() {
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: containerView.topAnchor),
            filterButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: FilterButtonSizing.leading),
            filterButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            filterButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            
            
        ])
    }
    
    private func setUCollectionViewConstraints() {
        genreCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genreCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            genreCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 4),
            
            genreCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 20),
            genreCollectionView.heightAnchor.constraint(equalToConstant: 21)
            
            
            
        ])
    }
    private func setUpSearchIconConstraints() {
        NSLayoutConstraint.activate([
            searchIcon.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            searchIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: SearchIconSizing.leading),
            searchIcon.trailingAnchor.constraint(equalTo: placeHolder.leadingAnchor, constant: SearchIconSizing.trailing),
            searchIcon.widthAnchor.constraint(equalToConstant: SearchIconSizing.width),
            searchIcon.heightAnchor.constraint(equalToConstant: SearchIconSizing.height)
            
        ])
    }
    
    private func setUpPlaceholderConstraints() {
        NSLayoutConstraint.activate([
            placeHolder.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            placeHolder.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: SearchBarSizing.placeholderLeading)
        ])
    }
    
    
}


//MARK: - UITextFieldDelegate
extension SearchBar: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        placeHolder.isHidden = true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let searchText = searchBar.text, searchText.isEmpty {
            placeHolder.isHidden = false
        }
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension SearchBar: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as! GenreCollectionViewCell
        cell.genreButton.setTitle(genres[indexPath.item], for: .normal)
        cell.genreButton.sizeToFit()
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? GenreCollectionViewCell {
//
//            cell.genreButton.isSelected.toggle()
//
//
//            let buttonBackgroundColor = cell.genreButton.isSelected ? Constants.Colors.yellow_primary : .clear
//            let titleColor = cell.genreButton.isSelected ? Constants.Colors.neutral_black : Constants.Colors.neutral_lighter_grey
//            cell.genreButton.setTitleColor(titleColor, for: .normal)
//            cell.genreButton.backgroundColor = buttonBackgroundColor
//        }
        print("selecteed")

    }
    
}
