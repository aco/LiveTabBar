//
//  UITabBarController.swift
//  LiveTabBar
//
//  Created by ac on 12/09/2018.
//

import Foundation
import UIKit

extension UITabBarController {

    /// Spawns a badge view above a tab item with a given animation
    ///
    /// - Parameters:
    ///   - tabPageIndex: Target tab (zero-based)
    ///   - value: Badge body
    ///   - backgroundColor: Badge background color
    ///   - animation: Any CAAnimation - either your own, a default, or none at all
    public func setLiveBadge(tabPageIndex: Int, value: String, backgroundColor: UIColor, animation: CAAnimation? = nil) {
        if let activeBadgeView = self.tabBar.viewWithTag(0xAC + tabPageIndex) as? UILabel { // destroy active badge & redraw
            activeBadgeView.removeFromSuperview()
        }
        
        let badgeLocation = CGFloat(tabPageIndex + 1)
        let itemWidth = tabBar.frame.width / CGFloat(tabBar.items?.count ?? 0)

        let xOffset: CGFloat = 12
        let yOffset: CGFloat = -16

        let badgeView = UILabel()
        
        badgeView.textColor = .white
        badgeView.textAlignment = .center
        badgeView.font = UIFont.systemFont(ofSize: 14)
        badgeView.text = value
        
        badgeView.center = CGPoint(x: (itemWidth * badgeLocation) - (itemWidth / 2) + xOffset, y: yOffset + 20)
        badgeView.frame.size = CGSize(width: 18, height: 18)
        
        badgeView.layer.cornerRadius = badgeView.bounds.width / 2
        badgeView.clipsToBounds = true
        
        badgeView.backgroundColor = backgroundColor
        badgeView.tag = 0xAC + tabPageIndex
        
        self.tabBar.addSubview(badgeView)
        
        if let badgeAnimation = animation {
            badgeView.layer.add(badgeAnimation, forKey: "ltbanimation")
        }
    }
    
    
    /// Dismisses an active badge view from a tab bar item
    ///
    /// - Parameters:
    ///   - tabPageIndex: Zero-based index of target tab
    ///   - fadeDuration: A duration for an animated dismissal (0 to dismiss immediately)
    public func dismissLiveBadge(tabPageIndex: Int, fadeDuration: Double = 0) {
        guard let badgeView = self.tabBar.viewWithTag(0xAC + tabPageIndex) else {
            return
        }

        UIView.animate(withDuration: fadeDuration, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            badgeView.alpha = 0
        }) { (_) in
            badgeView.removeFromSuperview()
        }
    }
}
