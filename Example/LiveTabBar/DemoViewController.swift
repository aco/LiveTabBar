//
//  DemoViewController.swift
//  LiveTabBar
//
//  Created by cewpur on 09/12/2018.
//  Copyright (c) 2018 cewpur. All rights reserved.
//

import UIKit
import LiveTabBar

public class DemoViewController: UIViewController {
    
    private let animationOptionTitles = ["Spring", "Bounce", "Wobble", "Spin"]

    private lazy var tabItemAnimationSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: animationOptionTitles)
        
        segment.layer.cornerRadius = 5.0
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentIndex = 0
        
        return segment
    }()
    
    private var presentTabControllerButton: UIButton = {
        let button = UIButton(type: UIButtonType.roundedRect)
        
        button.setTitle("Present tabbed controller", for: UIControlState())
        button.addTarget(self, action: #selector(presentTabController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .groupTableViewBackground
        
        view.addSubview(tabItemAnimationSegment)
        view.addSubview(presentTabControllerButton)
        
        tabItemAnimationSegment.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tabItemAnimationSegment.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20).isActive = true
        tabItemAnimationSegment.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
        
        presentTabControllerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        presentTabControllerButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: tabItemAnimationSegment.frame.height + 20).isActive = true
        presentTabControllerButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
    }
    
    @objc fileprivate func presentTabController() {
        let animationOption = [DefaultAnimation.spring, DefaultAnimation.bounce, DefaultAnimation.wobble, DefaultAnimation.spin][tabItemAnimationSegment.selectedSegmentIndex]
        var viewControllers: [UIViewController] = []
        
        for i in 0...3 {
            let viewController = DemoTabPageController(pageIndex: i)
            let tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab-\(i)")!.withRenderingMode(.alwaysTemplate), tag: i)
            
            tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
            tabBarItem.badgeColor = .red
            
            viewController.tabBarItem = tabBarItem
            viewController.view.backgroundColor = .groupTableViewBackground
            
            viewControllers.append(viewController)
        }
        
        let tabController = LiveTabBarController(tabItemAnimation: animationOption)
        let navController = UINavigationController(rootViewController: tabController)
        
        tabController.viewControllers = viewControllers
        tabController.navigationItem.title = "\(animationOptionTitles[tabItemAnimationSegment.selectedSegmentIndex]) Tab Animation"
        
        self.present(navController, animated: true, completion: nil)
    }
}

