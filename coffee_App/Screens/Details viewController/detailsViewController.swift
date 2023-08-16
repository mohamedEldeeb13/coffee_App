//
//  detailsViewController.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 12/08/2023.
//

import UIKit

class detailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var quantity00: UIButton!
    @IBOutlet weak var quantity01: UIButton!
    @IBOutlet weak var quantity02: UIButton!
    @IBOutlet weak var orderLbl: UILabel!
    
    
    var coffeeObject : PopularCoffee!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupComingData()
        setupUI()
    }
    
    private func setupUI(){
        
        backBtn.layer.cornerRadius = backBtn.frame.size.width / 2
        backBtn.clipsToBounds = true
        favBtn.layer.cornerRadius = favBtn.frame.size.width / 2
        favBtn.clipsToBounds = true
        
        quantity00.layer.borderWidth = 1
        quantity01.layer.borderWidth = 1
        quantity02.layer.borderWidth = 1
        quantity00.layer.borderColor = UIColor(named:"DarkGreenColor")?.cgColor
        quantity01.layer.borderColor = UIColor(named: "DarkGreenColor")?.cgColor
        quantity02.layer.borderColor = UIColor(named: "DarkGreenColor")?.cgColor
    }
    
    private func setupComingData(){
        imageView.image = coffeeObject.image
        titleLbl.text = coffeeObject.title
        priceLbl.text = coffeeObject.price
    }

    
    @IBAction func addCart(_ sender: Any) {
        let vc = orderViewController.instantiat(name: .Order)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    

    @IBAction func coffeeNumBtn(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            var num = Int(orderLbl.text!) ?? 0
            if num > 0 {
            num -= 1
            }
            orderLbl.text = String(num)
            break
        case 2:
            var num = Int(orderLbl.text!) ?? 0
            num += 1
            orderLbl.text = String(num)
            break
        default:
            break
            
       
        }
    }
    @IBAction func quantityBtn(_ sender: UIButton) {
        
        
        switch sender.tag{
        case 1:
            quantity00.backgroundColor = UIColor(named: "DarkGreenColor")
            quantity01.backgroundColor = UIColor(named: "BackgroundColor")
            quantity02.backgroundColor = UIColor(named: "BackgroundColor")
            
            quantity00.tintColor = UIColor(named: "BackgroundColor")
            quantity01.tintColor = UIColor(named: "DarkGreenColor")
            quantity02.tintColor = UIColor(named: "DarkGreenColor")
            break
        case 2:
            quantity00.backgroundColor = UIColor(named: "BackgroundColor")
            quantity01.backgroundColor = UIColor(named: "DarkGreenColor")
            quantity02.backgroundColor = UIColor(named: "BackgroundColor")
            
            quantity00.tintColor = UIColor(named: "DarkGreenColor")
            quantity01.tintColor = UIColor(named: "BackgroundColor")
            quantity02.tintColor = UIColor(named: "DarkGreenColor")
            break
        case 3:
            quantity00.backgroundColor = UIColor(named: "BackgroundColor")
            quantity01.backgroundColor = UIColor(named: "BackgroundColor")
            quantity02.backgroundColor = UIColor(named: "DarkGreenColor")
            
            quantity00.tintColor = UIColor(named: "DarkGreenColor")
            quantity01.tintColor = UIColor(named: "DarkGreenColor")
            quantity02.tintColor = UIColor(named: "BackgroundColor")
            break
        default:
            break
        }
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
