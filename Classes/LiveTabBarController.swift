//
//  LiveTabBarController.swift
//  LiveTabBar
//
//  Created by ac on 12/09/2018.
//

import Foundation
import UIKit

public class LiveTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private var tabItemAnimation: CAAnimation
    
    public override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let view = item.value(forKey: "view") as? UIView else {
            return
        }
    
        view.layer.add(self.tabItemAnimation, forKey: "ltbTabItemAnimation")
    }
    
    /// Initializes the LiveTabBarController - a subclass of ```UITabBarController```
    ///
    /// - Parameter tabItemAnimation: Default animation for tab bar items
    public init(tabItemAnimation: CAAnimation) {
        self.tabItemAnimation = tabItemAnimation
        
        super.init(nibName: nil, bundle: nil)
        self.delegate = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

