# LiveTabBar

[![CI Status](https://img.shields.io/travis/cewpur/LiveTabBar.svg?style=flat)](https://travis-ci.org/cewpur/LiveTabBar)
[![Version](https://img.shields.io/cocoapods/v/LiveTabBar.svg?style=flat)](https://cocoapods.org/pods/LiveTabBar)
[![License](https://img.shields.io/cocoapods/l/LiveTabBar.svg?style=flat)](https://cocoapods.org/pods/LiveTabBar)
[![Platform](https://img.shields.io/cocoapods/p/LiveTabBar.svg?style=flat)](https://cocoapods.org/pods/LiveTabBar)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first. Alternatively, run `pod try LiveTabBar` from the terminal.

| Name         | Tab Bar Demo   | Badge Demo    |
| :---         |     :---:      |          ---: |
| Spring       | <img src="https://raw.githubusercontent.com/cewpur/LiveTabBar/master/demos/tab-spring.gif" />  | <img src="https://raw.githubusercontent.com/cewpur/LiveTabBar/master/demos/badge-spring.gif" />
| Bounce       | <img src="https://raw.githubusercontent.com/cewpur/LiveTabBar/master/demos/tab-bounce.gif" />  | <img src="https://raw.githubusercontent.com/cewpur/LiveTabBar/master/demos/badge-bounce.gif" />
| Wobble       | <img src="https://raw.githubusercontent.com/cewpur/LiveTabBar/master/demos/tab-wobble.gif" />  | <img src="https://raw.githubusercontent.com/cewpur/LiveTabBar/master/demos/badge-wobble.gif" />
| Spin         | <img src="https://raw.githubusercontent.com/cewpur/LiveTabBar/master/demos/tab-spin.gif" />  | <img src="https://raw.githubusercontent.com/cewpur/LiveTabBar/master/demos/badge-spin.gif" />

## About
LiveTabBar is an easy way to spruce up tabbed iOS applications. It offers a simple interface built on top of UIKit for animating tab bar items and item badges. The library uses Core Animation (`CAAnimation`) and provides a set of default animations, but you can create your own so long as they conform to `CAAnimation`.

This library was made for subtle tab bar enhancements on top of UIKit. If you are looking for complete flexibility, check out [ESTabBarController](https://github.com/eggswift/ESTabBarController) which implements a custom tab bar system.

## Usage
### Tab Controller
Use `LiveTabBarController` in place of `UITabBarController`, supplying a tab animation. It subclasses `UITabBarController` and the interface has not been restricted or modified. From there, add your tabs and controllers as normal!

```Swift
let tabController = LiveTabBarController(tabItemAnimation: DefaultAnimation.spin)
tabController.viewControllers = [...

self.window?.rootViewController = UINavigationController(rootViewController: tabController)
```

### Badges
For a simpler interface, the live badges are implemented as an extension to `UITabBarController` and can be presented & dismissed without redundant casting. For example:

```Swift
self.tabBarController?.setLiveBadge(tabPageIndex: 0, value: "1", backgroundColor: .red,
                                    animation: DefaultAnimation.wobble) // present
                                    
self.tabBarController?.dismissLiveBadge(tabPageIndex: self.tabPageIndex, fadeDuration: 0.25) // dismiss
```

## Installation

LiveTabBar is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LiveTabBar'
```

## License

LiveTabBar is available under the MIT license. See the LICENSE file for more info.
