//
//  uiview+Extention.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 07/08/2023.
//

import Foundation
import UIKit

extension UIView{
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    @IBInspectable var cornerRadius: CGFloat{
        get{ return self.cornerRadius }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}

