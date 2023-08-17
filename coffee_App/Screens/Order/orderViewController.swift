//
//  orderViewController.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 16/08/2023.
//

import UIKit

class orderViewController: UIViewController {

    @IBOutlet weak var locView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locView.layer.borderWidth = 1.5
        locView.layer.borderColor = UIColor.black.cgColor

    }
    

    @IBAction func payBtn(_ sender: UIButton) {
        let stoeyBoard = UIStoryboard(name: "Order", bundle: nil)
        let vc = stoeyBoard.instantiateViewController(identifier: "ReleodViewController") as! ReleodViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
}
