//
//  HomeViewController.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 17.07.23.
//

import UIKit

class HomeViewController: UIViewController, FilterButtonDelegate {
    
    private var collectionView: UICollectionView!
    private var labelConstraints: [NSLayoutConstraint] = []
    private var collectionViewConstraints: [NSLayoutConstraint] = []
    private var scrolledConstraints: [NSLayoutConstraint] = []
    let offsetToScroll: CGFloat = Sizing.scrollSpacing
    private let viewModel = HomeViewModel()
    
    
    
    let searchBar = SearchBar()
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = Texts.label
        label.textColor = Constants.Colors.yellow_primary
        label.font = .boldSystemFont(ofSize: labelSizing.fontSize)
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.neutral_black
        view.addSubview(searchBar)
        
        view.addSubview(label)
        searchBar.isUserInteractionEnabled = true
        
        searchBar.filterButtonDelegate = self
        configureCollectionView()
        setUpConstraints()
        hideKeyboard()
        
    }
    
    
    
    func filterButtonTapped(isSelected: Bool) {

        
        if isSelected {
            NSLayoutConstraint.deactivate(labelConstraints)
            NSLayoutConstraint.deactivate(collectionViewConstraints)
            NSLayoutConstraint.activate(scrolledConstraints)

        } else {

            NSLayoutConstraint.deactivate(scrolledConstraints)
            NSLayoutConstraint.activate(labelConstraints)
            NSLayoutConstraint.activate(collectionViewConstraints)
        }
        
    }
    
    
    //MARK: - Hide keyoboard when tapping on screen
    private func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //    MARK: - ConfigureCollectionView
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: CollectionViewSizing.itemWidth, height: CollectionViewSizing.itemHeight)
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        view.addSubview(collectionView)
    }
    
    
    
    //MARK: - Set up constraints
    private func setUpConstraints() {
        setUpLabelConstraints()
        setUpCollectionViewConstraints()
        setUpSearchBarConstraints()
        updatedConstraints()
    }
    
    private func setUpLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        labelConstraints = [
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: labelSizing.top),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: labelSizing.leading),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: labelSizing.trailing),
            
        ]
        NSLayoutConstraint.activate(labelConstraints)
    }
    
    private func setUpCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: CollectionViewSizing.top),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CollectionViewSizing.leading),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CollectionViewSizing.trailing),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: CollectionViewSizing.bottom)
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
    
    
    
    private func setUpSearchBarConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: SearchBarSizing.top),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: SearchBarSizing.leading),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: SearchBarSizing.trailing),

            
        ])
    }
    
    //when filter button is pressed we need updated constraints
    private func updatedConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        scrolledConstraints = [
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: labelSizing.top + offsetToScroll),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: labelSizing.leading),
            
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: CollectionViewSizing.top),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CollectionViewSizing.leading),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CollectionViewSizing.trailing),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: CollectionViewSizing.bottom)
        ]
        NSLayoutConstraint.deactivate(scrolledConstraints)
    }
    
    
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        //        cell.layer.cornerRadius = CollectionViewSizing.cellCornerRadius
        cell.layer.masksToBounds = true
        
        cell.configure(with: viewModel.movieModel[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVc = DetailViewController()
        detailVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVc, animated: true)
        
    }
    
}

