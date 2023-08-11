//
//  favoriteCollectionViewCell.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 11/08/2023.
//

import UIKit

class favoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    
    static let id = String(describing: favoriteCollectionViewCell.self)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupFavorite(favorite : ShopSpecial){
        
        image.image = favorite.image
        title.text = favorite.name
        price.text = favorite.price
    }
    

}
