//
//  ReserveViewController.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 14/08/2023.
//

import UIKit

class ReserveViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var cakes: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var coffeeBtn: UIButton!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var name : UIImage!
    var generalProducts : [ShopSpecial] = []
    
    var shopSpecials: [ShopSpecial] = [
        .init(image: UIImage(named: "Avocado Coffee"), name: "Avocado Coffee", price: "134.00"),
        .init(image: UIImage(named: "Cappuccino"), name: "Cappuccino", price: "210.00"),
        .init(image: UIImage(named: "Chocolate coffee"), name: "Chocolate coffee", price: "234.00"),
        .init(image: UIImage(named: "Cortadito"), name: "Cortadito", price: "170.00"),
        .init(image: UIImage(named: "Normal coffee"), name: "Normal coffee", price: "120.00"),
        .init(image: UIImage(named: "South filtered"), name: "South filtered", price: "242.00")
    ]
    
    var cakesSpecials: [ShopSpecial] = [
        .init(image: UIImage(named: "cake00"), name: "Avocado Coffee", price: "134.00"),
        .init(image: UIImage(named: "cake01"), name: "Cappuccino", price: "210.00"),
        .init(image: UIImage(named: "cake02"), name: "Chocolate coffee", price: "234.00"),
        .init(image: UIImage(named: "cake03"), name: "Cortadito", price: "170.00"),
        .init(image: UIImage(named: "cake04"), name: "Normal coffee", price: "120.00"),
        .init(image: UIImage(named: "cake05"), name: "South filtered", price: "242.00")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generalProducts = shopSpecials
        imageView.image = name
        imageView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 20)
        registerCell()
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        
    }
    
    private func registerCell() {
        
        productCollectionView.register(UINib(nibName: ShopSpecialCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: ShopSpecialCollectionViewCell.id)
        
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func coffeeButton(_ sender: UIButton) {
        productCollectionView.reloadData()
        coffeeBtn.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        coffeeBtn.titleLabel?.textColor = UIColor.black
        
        cakes.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        cakes.titleLabel?.textColor = UIColor.systemGray
        
        generalProducts = shopSpecials
        productCollectionView.reloadData()
        
    }
    
    @IBAction func cakesButton(_ sender: UIButton) {
        productCollectionView.reloadData()
        cakes.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        cakes.titleLabel?.textColor = UIColor.black
        coffeeBtn.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        coffeeBtn.titleLabel?.textColor = UIColor.systemGray
        
        generalProducts = cakesSpecials
        productCollectionView.reloadData()
        
    }
    
    
    
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        generalProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopSpecialCollectionViewCell.id, for: indexPath) as! ShopSpecialCollectionViewCell
            cell.setup(generalProducts[indexPath.row])
            return cell
    }

}
