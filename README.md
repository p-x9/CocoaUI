# CocoaUI

Obtain and customize UIKit/Cocoa objects from SwiftUI components.

## Demo
For example, Slider uses UISlider internally.
Therefore, it can be customized by directly referencing the UISlider object as follows.

```swift
 Slider(value: $value)
    .cocoa { slider in // UISider
        slider.setThumbImage(.init(systemName: "swift"), for: .normal)
    }
```

## Document
For components conforming to the protocol named `CocoaBridging`, you can get UIKit/Cocoa objects as follows.
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

If the specified type is not found, the closure will not be called.

### Support additional component
```swift
extension XXView: CocoaBridging { // confirms `CocoaBridging`
    public typealias DefaultCocoaType = XXCocoaView // UIKit/Cocoa type
}
```

## SwiftUI and Cocoa correspondence table
This may vary depending on the operating system and usage conditions.

|SwiftUI|style|UIKit|Cocoa|
|:----:|:----:|:----:|:----:|
|ScrollView|-| UIScrollView|NSScrollView|
|List|-| UICollectionView(>=iOS16) UITableView(<iOS16)|NSTableView|
|TextField|-| UITextField|NSTextField|
|Slider|-|UISlider|NSSlider|
|Stepper|-|UIStepper|NSStepper|
|Picker|Wheel|UIPickerView|NSButton|
||Inline|UIPickerView|?|
||Segmented|UISegmentedControl|NSSegmentedControl|
||Menu|?|NSButton|
|DatePicker|-|UIDatePicker|NSDatePicker|
|ColorPicker|-|UIColorWell|NSColorWell|
|Toggle|.switch|UISwitch| NSSwitch |
| |.button|UIButton| NSButton |
| |.checkbox|-| NSButton |
|TextEditor|-|UITextView|NSTextView|
|Button|-|-|NSButton|
