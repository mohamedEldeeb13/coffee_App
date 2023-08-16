//
//  HomeViewController.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 07/08/2023.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var nearestCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var coffeeTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var popularCoffees: [PopularCoffee] = [
        .init(image: UIImage(named: "Cappuccino"), time: "10 min delivery", rating: "5.0", title: "Cappuccino", price: "550.00", location: "Coffee cafe"),
        .init(image: UIImage(named: "Chocolate Coffee"), time: "7 min delivery", rating: "5.0", title: "Chocolate Coffee", price: "510.00", location: "Bunny cafe"),
        .init(image: UIImage(named: "Coffee Milk"), time: "7 min delivery", rating: "5.0", title: " Coffee Milk", price: "515.00", location: "Coffee hut"),
        .init(image: UIImage(named: "Coffee"), time: "10 min delivery", rating: "5.0", title: "Coffee", price: "550.00", location: "Coffee cafe")
    ]
    var cofffeeShops: [CoffeeShop] = [
        .init(image: UIImage(named: "CoffeeShop01"), title: "Asley coffee", rating: "5.0/ 105 ratings", destance: "1.5 km"),
        .init(image: UIImage(named: "CoffeeShop02"), title: "Old town coffee", rating: "4.0/ 125 ratings", destance: "2.4 km"),
        .init(image: UIImage(named: "CoffeeShop03"), title: "Asador Etxebarri", rating: "5.0/ 105 ratings", destance: "1.5 km"),
        .init(image: UIImage(named: "CoffeeShop04"), title: "Trèsind Studio", rating: "4.0/ 125 ratings", destance: "2.4 km")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        nearestCollectionView.delegate = self
        nearestCollectionView.dataSource = self
        
        setupUI()
        registerCell()

      
    }
    private func setupUI(){
        
        setupTitleUI()
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        searchTextField.layer.cornerRadius = 15
        searchTextField.clipsToBounds = true
        searchTextField.borderStyle = .none
        
    }
    
    private func setupTitleUI(){
        
        coffeeTitle.text = "Get your Coffee \non one finger tap"
        let str = "Coffee"
        let range = (coffeeTitle.text! as NSString).range(of: str)
        let attributedText = NSMutableAttributedString.init(string: coffeeTitle.text!)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "CoffeeColor")!, range: range)
        coffeeTitle.attributedText = attributedText

    }
    
    
    private func registerCell(){
        popularCollectionView.register(UINib(nibName: popularCoffeeCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: popularCoffeeCollectionViewCell.id)
        nearestCollectionView.register(UINib(nibName: nearestCoffeeCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: nearestCoffeeCollectionViewCell.id)
    }

}
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case popularCollectionView:
            return popularCoffees.count
        case nearestCollectionView:
            return cofffeeShops.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularCoffeeCollectionViewCell.id, for: indexPath) as! popularCoffeeCollectionViewCell
            cell.setUpPopularCoffee(popular: popularCoffees[indexPath.row])
            return cell
        case nearestCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nearestCoffeeCollectionViewCell.id, for: indexPath) as! nearestCoffeeCollectionViewCell
            cell.setupNearestCoffee(nearest: cofffeeShops[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == popularCollectionView {
            let controller = detailsViewController(nibName: "detailsViewController", bundle: nil)
            controller.coffeeObject = popularCoffees[indexPath.row]
            controller.modalTransitionStyle = .crossDissolve
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
            
        }else {
            
            let controller = NearbyCafesViewController.instantiat(name: .NearbyCafes)
            controller.cafeObject = cofffeeShops[indexPath.row]
            controller.modalTransitionStyle = .crossDissolve
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        }
    }
    
    
}
