//
//  DoneViewController.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 17/08/2023.
//

import UIKit

class DoneViewController: UIViewController {

    @IBOutlet weak var doneImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gifImage = UIImage.gifImageWithName("Done")
        doneImage.image = gifImage

        
    }
    

   
    @IBAction func backBtn(_ sender: UIButton) {
        
        // I use UnWind Method to go to first screen "custom tabBar"
        
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(identifier: "TabBar") as! CustomTabBar
//
//        UIApplication.shared.windows.first?.rootViewController = vc
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
}
