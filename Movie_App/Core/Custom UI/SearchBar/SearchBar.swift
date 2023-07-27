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
    private lazy var searchTextfield = UITextField()
    lazy var containerView = UIView()
    var genreCollectionView: UICollectionView!
    weak var filterButtonDelegate: FilterButtonDelegate?
  
    
    var isGenreCollectionViewVisible: Bool = false
//    var isClearButtonVisible: Bool = false
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
    
    private lazy var filterButton: UIButton = {
        let filterButton = UIButton()
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.setImage(UIImage(assetIdentifier: Constants.AssetIdentifier.filterButton), for: .normal)
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        filterButton.isSelected = false
        return filterButton
    }()
    
    private lazy var clearButton: UIButton = {
        let clearButton = UIButton()
        
        clearButton.setTitle("cancel", for: .normal)
        clearButton.clipsToBounds = true
       
        clearButton.titleLabel?.numberOfLines = 0
        clearButton.titleLabel?.font = .systemFont(ofSize: 10)
        clearButton.titleLabel?.textColor = Constants.Colors.Neutral_Whisper
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
        return clearButton
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(containerView)
        containerView.addSubview(searchTextfield)
        containerView.addSubview(filterButton)
        searchTextfield.addSubview(searchIcon)
        searchTextfield.addSubview(placeHolder)
        containerView.addSubview(clearButton)
        setUpContainerView()
        setUpSearchBar()
        configureGenreCollectionView()
        setUpConstraints()
        addPadding()
//        clearButton.isHidden = true
        clearButton.isHidden = true
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
    
    @objc func clearButtonTapped() {
        searchTextfield.text = ""
        clearButton.isHidden = true
        filterButton.isHidden = false
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
        
        
        addSubview(genreCollectionView)
        
    }
    
    private func addPadding() {
        let paddingView = UIView(frame: CGRect(x: .zero,
                                               y: .zero,
                                               width: SearchBarSizing.widthPadding,
                                               height: SearchBarSizing.heightPadding)
        )
        searchTextfield.leftView = paddingView
        searchTextfield.leftViewMode = .always
        
    }
    private func setUpSearchBar() {
        searchTextfield.layer.cornerRadius = SearchBarSizing.cornerRadius
        searchTextfield.textColor = Constants.Colors.neutral_light_grey
        searchTextfield.backgroundColor = .clear
        searchTextfield.backgroundColor = Constants.Colors.neutral_darkest_grey
        searchTextfield.translatesAutoresizingMaskIntoConstraints = false
        searchTextfield.autocorrectionType = .no
        searchTextfield.clipsToBounds = true
        searchTextfield.delegate = self
        
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
        setUpClearButtonConstraints()
    }
    
    private func setUpContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 65)
            //            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: ContainerViewSizing.height)
            
        ])
    }
    
    private func setUpSearchBarConstraints() {
        NSLayoutConstraint.activate([
            searchTextfield.topAnchor.constraint(equalTo: containerView.topAnchor),
            searchTextfield.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: SearchBarSizing.leading),
            searchTextfield.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -SearchBarSizing.trailing),
            searchTextfield.heightAnchor.constraint(equalToConstant: 36)
            
            
        ])
    }
    private func setUpClearButtonConstraints() {
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            clearButton.centerYAnchor.constraint(equalTo: searchTextfield.centerYAnchor),
            clearButton.heightAnchor.constraint(equalToConstant: 18),
            clearButton.widthAnchor.constraint(equalToConstant: 36),

            clearButton.leadingAnchor.constraint(equalTo: searchTextfield.trailingAnchor, constant: 5)
            
            
        ])
    }
    
    
    private func setUpFilterButtonConstraints() {
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: containerView.topAnchor),
            filterButton.leadingAnchor.constraint(equalTo: searchTextfield.trailingAnchor, constant: FilterButtonSizing.leading),
            filterButton.heightAnchor.constraint(equalToConstant: 36),
            filterButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            
            
        ])
    }
    
    private func setUCollectionViewConstraints() {
        genreCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genreCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4),
            genreCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 20),
            genreCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            genreCollectionView.heightAnchor.constraint(equalToConstant: 21)
            
            
            
        ])
    }
    private func setUpSearchIconConstraints() {
        NSLayoutConstraint.activate([
            searchIcon.centerYAnchor.constraint(equalTo: searchTextfield.centerYAnchor),
            searchIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: SearchIconSizing.leading),
            searchIcon.trailingAnchor.constraint(equalTo: placeHolder.leadingAnchor, constant: SearchIconSizing.trailing),
            searchIcon.widthAnchor.constraint(equalToConstant: SearchIconSizing.width),
            searchIcon.heightAnchor.constraint(equalToConstant: SearchIconSizing.height)
            
        ])
    }
    
    private func setUpPlaceholderConstraints() {
        NSLayoutConstraint.activate([
            placeHolder.centerYAnchor.constraint(equalTo: searchTextfield.centerYAnchor),
            placeHolder.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: SearchBarSizing.placeholderLeading)
        ])
    }
    
    
}


//MARK: - UITextFieldDelegate
extension SearchBar: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        placeHolder.isHidden = true
        filterButton.isHidden = true
        clearButton.isHidden = false
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let searchText = searchTextfield.text, searchText.isEmpty {
            placeHolder.isHidden = false
            filterButton.isHidden = false
            clearButton.isHidden = true
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
        let selectedItem = genres[indexPath.row]
        if let cell = collectionView.cellForItem(at: indexPath) as? GenreCollectionViewCell {
            cell.genreButton.isSelected.toggle()
            updateCellAppearanceOnTap(cell)
            
        }
        print(selectedItem)
    }
    
    private func updateCellAppearanceOnTap(_ cell: GenreCollectionViewCell) {
        let isSelected = cell.genreButton.isSelected
        let buttonBackgroundColor = isSelected ? Constants.Colors.yellow_primary : .clear
        let borderColor = isSelected ? .clear : Constants.Colors.neutral_lighter_grey
        let titleColor = isSelected ? Constants.Colors.neutral_black : Constants.Colors.neutral_lighter_grey
        
        cell.genreButton.layer.borderColor = borderColor.cgColor
        cell.genreButton.setTitleColor(titleColor, for: .normal)
        cell.genreButton.backgroundColor = buttonBackgroundColor
    }
    
}


