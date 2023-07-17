//
//  HomeViewController.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 17.07.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var collectionView: UICollectionView?

    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Movies"
        label.textColor = Constants.Colors.yellow_primary
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.neutral_black
        view.addSubview(label)
    
        setUpConstraints()
//        conffigureCollectionView()
    }
    
    private func conffigureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView?.backgroundColor = .clear
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "item")
        collectionView.frame = view.bounds
//        collectionView.backgroundColor = .green
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
////       collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
//
//        layout.scrollDirection = .vertical
//        collectionView.setCollectionViewLayout(layout, animated: true)
//        layout.itemSize = CGSize(width: 163.5, height: 226)
//        collectionView.layer.cornerRadius = 16
    }
    
    private func setUpConstraints() {
        setUpLabelConstraints()
//        setUpCollectionViewConstraints()
    }
    
    private func setUpLabelConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 77),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -293)
        ])
    }
//    private func setUpCollectionViewConstraints() {
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
//            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
//        ])
//    }


}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
        cell.contentView.backgroundColor = Constants.Colors.yellow_primary
        return cell
    }
    
}

