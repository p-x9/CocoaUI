# CocoaUI

A description of this package.

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
