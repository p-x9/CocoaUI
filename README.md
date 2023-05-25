# CocoaUI

Obtain and customize UIKit/Cocoa objects from SwiftUI components.

<!-- # Badges -->

[![Github issues](https://img.shields.io/github/issues/p-x9/CocoaUI)](https://github.com/p-x9/CocoaUI/issues)
[![Github forks](https://img.shields.io/github/forks/p-x9/CocoaUI)](https://github.com/p-x9/CocoaUI/network/members)
[![Github stars](https://img.shields.io/github/stars/p-x9/CocoaUI)](https://github.com/p-x9/CocoaUI/stargazers)
[![Github top language](https://img.shields.io/github/languages/top/p-x9/CocoaUI)](https://github.com/p-x9/CocoaUI/)

## Demo
For example, Slider uses UISlider internally.
Therefore, it can be customized by directly referencing the UISlider object as follows.

```swift
 Slider(value: $value)
    .cocoa { slider in // UISider
        slider.setThumbImage(.init(systemName: "swift"), for: .normal)
    }
```
![Slider](https://user-images.githubusercontent.com/50244599/229353608-86eb9a3c-815e-4919-9f44-1cc35d244d7e.png)

## Document
For components conforming to the protocol named `DefaultCocoaViewBridging`, you can get UIKit/Cocoa objects as follows.
`DefaultCocoaViewBridging` gets the UIView object from SwiftUI.View.
In contrast, `DefaultCocoaControllerBridging` gets the UIViewController object.
</br>
The CocoaBriding protocol defines a `DefaultCocoaType`.　　
For example, for Toggle, the DefaultCocoaType is UISwitch(iOS).　　
It can be handled as follows

```swift
 Toggle("Hello", isOn: .constant(true))
    .cocoa { `switch` in
        `switch`.onTintColor = .red
    }
```
### Specify type
However, if the ToggleStyle is set to `Button`, `UIButton` is used internally instead of `UISwitch`.
For such cases, it is also possible to retrieve the data by specifying the type as follows.

```swift
Toggle("Hello", isOn: .constant(true))
    .cocoa(for: UIButton.self) { button in
       button.layer.borderWidth = 1
    }
```
The method of specifying the type is defined in SwiftUI.View's and does not need to conform to the `DefaultCocoaViewBridging` or `DefaultCocoaControllerBridging ` protocols.
If the specified type is not found, the closure will not be called.

### Support additional component
```swift
extension XXView: DefaultCocoaViewBridging { // confirms `DefaultCocoaViewBridging`
    public typealias DefaultCocoaViewType = XXCocoaView // UIKit/Cocoa type
}

extension YYView: DefaultCocoaViewControllerBridging { // confirms `DefaultCocoaViewControllerBridging`
    public typealias DefaultCocoaControllerType = YYCocoaViewController // UIKit/Cocoa type
}
```

### LifeCycle Event Modifiers
In some View lifecycle events, a modifier is provided to retrieve the obtained UIKit/Cocoa object.
As an example, the following code hides the tabBar on push and redisplays it on pop.
```swift
TabView {
    NavigationView {
        List(0..<100) { i in
            NavigationLink {
                Text("Detail: \(i)")
                    .cocoa(for: CocoaViewController.self) { vc in
                        print(vc)
                    }
                    .onViewWillAppear { vc in
                        // Hide TabBar
                        vc?.tabBarController?.tabBar.isHidden = true
                    }
                    .onViewWillDisappear { vc in
                        // Show TabBar
                        vc?.tabBarController?.tabBar.isHidden = false
                    }
            } label: {
                Text("Row: \(i)")
            }
        }
    }
}
```

The following modifiers are available.
- onViewWillAppear
- onViewDidLoad
- onViewWillDisappear
- onViewDidDisAppear

## SwiftUI and Cocoa correspondence table
This may vary depending on the operating system and usage conditions.

|SwiftUI|style|UIKit(iOS)|Cocoa(macOS)|UIKit(tvOS)|
|:----:|:----:|:----:|:----:|:----:|
|ScrollView|-| UIScrollView|NSScrollView|UIScrollView|
|List|-| UICollectionView(>=iOS16) UITableView(<iOS16)|NSTableView|UITableView|
|Form|-| UICollectionView(>=iOS16) UITableView(<iOS16)|?|UITableView|
|TextField|-| UITextField|NSTextField|UITextField|
|SecureField|-| UITextField|NSTextField|UITextField|
|Slider|-|UISlider|NSSlider|-|
|Stepper|-|UIStepper|NSStepper|-|
|Picker|Wheel|UIPickerView|NSButton|-|
||Inline|UIPickerView|?|UISegmentedControl|
||Segmented|UISegmentedControl|NSSegmentedControl|UISegmentedControl|
||Menu|?|NSButton|-|
|DatePicker|-|UIDatePicker|NSDatePicker|-|
|MultiDatePicker|-|UICalendarView|-|-|
|ColorPicker|-|UIColorWell|NSColorWell|-|
|Toggle|.switch|UISwitch| NSSwitch |-|
| |.button|UIButton| NSButton |-|
| |.checkbox|-| NSButton |-|
|TextEditor|-|UITextView|NSTextView|-|
|Button|-|-|NSButton|-|
|ProgressView|.linear|UIProgressView|NSProgressIndicator|UIProgressView|
||.circular|UIActivityIndicatorView|NSProgressIndicator|UIActivityIndicatorView|
|TabView|-|UITabBarController|NSTabView|UITabBarController|
|NavigationView|DoubleColumn|UISplitViewController|NSSplitView|-|
||Stack|UINavigationController|-|UINavigationController|
|NavigationStack|-|UINavigationController|?|UINavigationController|
|NavgationSplitView|-|UISplitViewController|NSSplitView|-|
