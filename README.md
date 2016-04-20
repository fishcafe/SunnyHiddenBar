# SunnyHiddenBar

[![CI Status](http://img.shields.io/travis/amaker/SunnyHiddenBar.svg?style=flat)](https://travis-ci.org/amaker/SunnyHiddenBar)
[![Version](https://img.shields.io/cocoapods/v/SunnyHiddenBar.svg?style=flat)](http://cocoapods.org/pods/SunnyHiddenBar)
[![License](https://img.shields.io/cocoapods/l/SunnyHiddenBar.svg?style=flat)](http://cocoapods.org/pods/SunnyHiddenBar)
[![Platform](https://img.shields.io/cocoapods/p/SunnyHiddenBar.svg?style=flat)](http://cocoapods.org/pods/SunnyHiddenBar)

SunnyHiddenBar is an Hidden Navigation library written in Swift.

## Features

- [x] Release 0.1.0

## Requirements

- iOS 8.0+ / Mac OS X 10.9+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 7.3+

## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/SunnyHiddenBar). (Tag 'sunnyhiddenbar')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/SunnyHiddenBar.
                                                                    - If you **found a bug**, open an issue.
                                                                    - If you **have a feature request**, open an issue.
                                                                    - If you **want to contribute**, submit a pull request.
                                                                    
                                                                    
                                                                    ## Usage
                                                                    
                                                                    
                                                                    ```swift
                                                                    
                                                                    override func viewDidLoad() {
super.viewDidLoad()
self.keyScrollView = self.tableView
}

override func viewWillAppear(animated: Bool) {
super.viewWillAppear(animated)
self.setInViewWillAppear()
}

override func viewWillDisappear(animated: Bool) {
super.viewWillDisappear(animated)
self.setInViewWillDisappear()
}

override func scrollViewDidScroll(scrollView: UIScrollView) {
self.scrollControlByOffsetY(200)
}



```

---



## Installation

> **Embedded frameworks require a minimum deployment target of iOS 8 or OS X Mavericks (10.9).**
>
> SunnyHiddenBar is no longer supported on iOS 7 due to the lack of support for frameworks. Without frameworks, running Travis-CI against iOS 7 would require a second duplicated test target. The separate test suite would need to import all the Swift files and the tests would need to be duplicated and re-written. This split would be too difficult to maintain to ensure the highest possible quality of the SunnyHiddenBar ecosystem.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required to build SunnyHiddenBar 0.1.0+.

To integrate SunnyHiddenBar into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'SunnyHiddenBar', '~> 0.1.0'
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SunnyHiddenBar into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "fishcafe/SunnyHiddenBar" ~> 0.1.0
```

Run `carthage update` to build the framework and drag the built `SunnyHiddenBar.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate SunnyHiddenBar into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add SunnyHiddenBar as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/fishcafe/SunnyHiddenBar.git
```

- Open the new `SunnyHiddenBar` folder, and drag the `SunnyHiddenBar.xcodeproj` into the Project Navigator of your application's Xcode project.

> It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `SunnyHiddenBar.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `SunnyHiddenBar.xcodeproj` folders each with two different versions of the `SunnyHiddenBar.framework` nested inside a `Products` folder.

> It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `SunnyHiddenBar.framework`. 

- Select the top `SunnyHiddenBar.framework` for iOS and the bottom one for OS X.

> You can verify which one you selected by inspecting the build log for your project. The build target for `SunnyHiddenBar` will be listed as either `SunnyHiddenBar iOS` or `SunnyHiddenBar OSX`.

- And that's it!

> The `SunnyHiddenBar.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

---


## Author

amaker, itamaker@gmail.com


##Github

https://github.com/itamaker



## FAQ

### Security Disclosure

If you believe you have identified a security vulnerability with SunnyHiddenBar, you should report it as soon as possible via email to itamaker@gmail.com. Please do not post it to a public issue tracker.

## License

SunnyHiddenBar is released under the MIT license. See LICENSE for details.


