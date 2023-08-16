//
//  ShopSpecialCollectionViewCell.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 15/08/2023.
//

import UIKit

class ShopSpecialCollectionViewCell: UICollectionViewCell {
    static let id = String(describing: ShopSpecialCollectionViewCell.self)
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ coffee: ShopSpecial){
        imageView.image = coffee.image
        titleLbl.text = coffee.name
        price.text = coffee.price
    }


}
