//
//  UiViewController+Etention.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 07/08/2023.
//

import Foundation
import UIKit

extension UIViewController{
    
   static var identifier : String {
        
       return String(describing: self)
        
    }
    static func instantiat(name: StoryboardEnum) -> Self {
        let storyBoard = UIStoryboard(name: name.rawValue, bundle: nil)
        return storyBoard.instantiateViewController(identifier: identifier) as! Self
    }
    enum StoryboardEnum: String {
        case Order = "Order"
        case NearbyCafes = "NearbyCafes"
        case Reserve = "Reserve"
        
    }
}
