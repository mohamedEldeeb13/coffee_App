//
//  favoriteViewController.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 11/08/2023.
//

import UIKit

class favoriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 

    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    var favArray : [ShopSpecial] = [
        
        .init(image: UIImage(named: "Cappuccino"), name: "Cappuccino", price: "210.00"),
        .init(image: UIImage(named: "Chocolate coffee"), name: "Chocolate coffee", price: "234.00"),
        .init(image: UIImage(named: "Cortadito"), name: "Cortadito", price: "170.00"),
        .init(image: UIImage(named: "South filtered"), name: "South filtered", price: "242.00")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteCollectionView.delegate = self
        favoriteCollectionView.dataSource = self
        
        regiterCall()
    }
    
    private func regiterCall(){
        
        favoriteCollectionView.register(UINib(nibName: favoriteCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: favoriteCollectionViewCell.id)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favoriteCollectionViewCell.id, for: indexPath) as! favoriteCollectionViewCell
        cell.setupFavorite(favorite: favArray[indexPath.row])
        return cell
    }
    
  
}
