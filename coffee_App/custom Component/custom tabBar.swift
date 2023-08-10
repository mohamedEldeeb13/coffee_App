//
//  custom tabBar.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 07/08/2023.
//

import Foundation
import UIKit


class CustomTabBar : UITabBarController {
    
    override func viewDidLoad() {
        changRaduisOfTabBar()
    }
    
    func changRaduisOfTabBar(){
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 35
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    override func viewDidLayoutSubviews() {
        changeHieghtOfTabBar()
    }
    
    func changeHieghtOfTabBar(){
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 80
            tabFrame.origin.y = view.frame.size.height - 80
            tabBar.frame = tabFrame
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        simpleAnimation(item)
    }
    func simpleAnimation(_ item : UITabBarItem){
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        
        let timeInterval : TimeInterval = 0.5
        let propertryAnmator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }
        propertryAnmator.addAnimations({ barItemView.transform = .identity}, delayFactor: timeInterval)
        propertryAnmator.startAnimation()
    }
}
