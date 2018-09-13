//
//  DemoTabPageController.swift
//  LiveTabBar_Example
//
//  Created by ac on 13/09/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import LiveTabBar

public class DemoTabPageController: UIViewController {
    
    private let tabPageIndex: Int
    private var badgeActive: Bool
    
    private var badgeAnimationSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Spring", "Bounce", "Wobble", "Spin"])
        
        segment.layer.cornerRadius = 5.0
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentIndex = 0
        
        return segment
    }()
    
    private var toggleBadgeButton: UIButton = {
        let button = UIButton(type: UIButtonType.roundedRect)
        
        button.setTitle("Toggle badge", for: UIControlState())
        button.addTarget(self, action: #selector(spawnTabBadge), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var dismissButton: UIButton = {
        let button = UIButton(type: UIButtonType.roundedRect)
        
        button.setTitle("Dismiss controller", for: UIControlState())
        button.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    public init(pageIndex: Int) {
        self.tabPageIndex = pageIndex
        self.badgeActive = false
        
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = .groupTableViewBackground
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(badgeAnimationSegment)
        view.addSubview(toggleBadgeButton)
        view.addSubview(dismissButton)
        
        badgeAnimationSegment.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        badgeAnimationSegment.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20).isActive = true
        badgeAnimationSegment.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
        
        toggleBadgeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        toggleBadgeButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: badgeAnimationSegment.frame.height + 20).isActive = true
        toggleBadgeButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
        
        dismissButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: badgeAnimationSegment.frame.height + 70).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
    }
    
    @objc fileprivate func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func spawnTabBadge() {
        if self.badgeActive {
            self.tabBarController?.dismissLiveBadge(tabPageIndex: self.tabPageIndex, fadeDuration: 0.25)
        } else {
            let animationOption = [DefaultAnimation.spring, DefaultAnimation.bounce, DefaultAnimation.wobble, DefaultAnimation.spin][badgeAnimationSegment.selectedSegmentIndex]
            
            self.tabBarController?.setLiveBadge(tabPageIndex: self.tabPageIndex, value: "1", backgroundColor: .red, animation: animationOption)
        }
        
        self.badgeActive = !self.badgeActive
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
