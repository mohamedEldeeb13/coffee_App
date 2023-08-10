//
//  popularCoffeeCollectionViewCell.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 08/08/2023.
//

import UIKit

class popularCoffeeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var coffeeNameLbl: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var heartBtn: UIButton!
    
    static let id = String(describing: popularCoffeeCollectionViewCell.self)

    
    override func awakeFromNib() {
        super.awakeFromNib()
        heartBtn.layer.cornerRadius = heartBtn.frame.size.width / 2
        
    }
    
    func setUpPopularCoffee(popular : PopularCoffee){
        image.image = popular.image
        timeLbl.text = popular.time
        ratingLbl.text = popular.rating
        coffeeNameLbl.text = popular.title
        price.text = popular.price
        locationLbl.text = popular.location
    }

}
