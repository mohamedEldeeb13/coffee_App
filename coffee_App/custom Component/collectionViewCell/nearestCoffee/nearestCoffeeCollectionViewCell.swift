//
//  nearestCoffeeCollectionViewCell.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 08/08/2023.
//

import UIKit

class nearestCoffeeCollectionViewCell: UICollectionViewCell {
    
    
    static let id = String(describing: nearestCoffeeCollectionViewCell.self)

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var rting: UILabel!
    @IBOutlet weak var blurView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBlurViewUI()
    }
    
    func setupNearestCoffee(nearest : CoffeeShop ){
        image.image = nearest.image
        distance.text = nearest.destance
        title.text = nearest.title
        rting.text = nearest.rating
        
    }
    
    func setupBlurViewUI(){
        blurView.roundCorners(corners: [.topRight, .bottomLeft], radius: 20)
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blurView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView = blurEffectView
    }

}
