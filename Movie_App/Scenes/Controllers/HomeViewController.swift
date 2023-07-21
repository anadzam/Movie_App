//
//  HomeViewController.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 17.07.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    
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
        view.addSubview(label)
        view.addSubview(searchBar)
        configureCollectionView()
        
        setUpConstraints()
        hideKeyboard()
    }
    
    //MARK: - hideKeyboard
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
    }
    private func setUpLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: labelSizing.top),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: labelSizing.leading),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: labelSizing.trailing)
        ])
    }
    
    private func setUpCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: CollectionViewSizing.top),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CollectionViewSizing.leading),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CollectionViewSizing.trailing),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: CollectionViewSizing.bottom)
        ])
    }
    
  
    
    private func setUpSearchBarConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: SearchBarSizing.top),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: SearchBarSizing.leading),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: SearchBarSizing.trailing),
            searchBar.bottomAnchor.constraint(equalTo: label.topAnchor, constant: SearchBarSizing.bottom)
            
        ])
    }
    
    
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath)
        //        cell.layer.cornerRadius = CollectionViewSizing.cellCornerRadius
        cell.layer.masksToBounds = true
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVc = DetailViewController()
        detailVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVc, animated: true)



    }

}

