//
//  typealias.swift
//  
//
//  Created by p-x9 on 2023/04/01.
//  
//
import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

#if canImport(UIKit)
public typealias CocoaView = UIView
#elseif canImport(Cocoa)
public typealias CocoaView = NSView
#endif

#if canImport(UIKit)
public typealias CocoaViewRepresentable = UIViewRepresentable
#elseif canImport(Cocoa)
public typealias CocoaViewRepresentable = NSViewRepresentable
#endif

#if canImport(UIKit)
public typealias CocoaViewControllerRepresentable = UIViewControllerRepresentable
#elseif canImport(Cocoa)
public typealias CocoaViewControllerRepresentable = NSViewControllerRepresentable
#endif

#if canImport(UIKit)
public typealias CocoaHostingController = UIHostingController
#elseif canImport(Cocoa)
public typealias CocoaHostingController = NSHostingController
#endif

#if canImport(UIKit)
public typealias CocoaScrollView = UIScrollView
#elseif canImport(Cocoa)
public typealias CocoaScrollView = NSScrollView
#endif

#if canImport(UIKit)
public typealias CocoaCollectionView = UICollectionView
#elseif canImport(Cocoa)
public typealias CocoaCollectionView = NSCollectionView
#endif

#if canImport(UIKit)
public typealias CocoaTextField = UITextField
#elseif canImport(Cocoa)
public typealias CocoaTextField = NSTextField
#endif

#if canImport(UIKit)
public typealias CocoaSwitch = UISwitch
#elseif canImport(Cocoa)
public typealias CocoaSwitch = NSSwitch
#endif

#if canImport(UIKit)
public typealias CocoaSlider = UISlider
#elseif canImport(Cocoa)
public typealias CocoaSlider = NSSlider
#endif

#if canImport(UIKit)
public typealias CocoaStepper = UIStepper
#elseif canImport(Cocoa)
public typealias CocoaStepper = NSStepper
#endif

#if canImport(UIKit)
public typealias CocoaDatePicker = UIDatePicker
#elseif canImport(Cocoa)
public typealias CocoaDatePicker = NSDatePicker
#endif

#if canImport(UIKit)
public typealias CocoaTextView = UITextView
#elseif canImport(Cocoa)
public typealias CocoaTextView = NSTextView
#endif

#if canImport(UIKit)
@available(iOS 14.0, *)
public typealias CocoaColorWell = UIColorWell
#elseif canImport(Cocoa)
public typealias CocoaColorWell = NSColorWell
#endif
