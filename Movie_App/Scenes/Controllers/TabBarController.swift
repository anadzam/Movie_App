//
//  ViewController.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 17.07.23.
//

import UIKit

class TabBarController: UITabBarController {
    let tabBaritem = [Constants.AssetIdentifier.home, Constants.AssetIdentifier.favorites]
    let selectedTabBarItem = [Constants.AssetIdentifier.selectedHome, Constants.AssetIdentifier.selectedFavoirtes]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .clear
        setUpTabBar()
        
    }
    
    func setUpTabBar() {
        let homeVc = HomeViewController()
        let favoriteVc = FavoriteViewController()
        let navFavoriteVc = UINavigationController(rootViewController: favoriteVc)

        self.setViewControllers([homeVc, navFavoriteVc], animated: false)
        
        guard let items = self.tabBar.items else {
            return
        }
        
        for index in 0..<items.count {
            let item = items[index]
            let imageName = tabBaritem[index].rawValue
            let selectedImageName = selectedTabBarItem[index].rawValue
            
            
            item.image = UIImage(named: imageName)
            item.selectedImage = UIImage(named: selectedImageName)
        }
        
        self.tabBar.tintColor = .clear
    }
    
    
    
}

