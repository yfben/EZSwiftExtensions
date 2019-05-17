//
//  UIDeviceExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

/// EZSwiftExtensions
private let DeviceList = [
    //simulator
    "i386": "Simulator",
    "x86_64": "Simulator",
    
    //AirPods
    "AirPods1,1": "AirPods",
    
    //Apple TV
    "AppleTV2,1": "Apple TV (2nd generation)",
    "AppleTV3,1": "Apple TV (3rd generation)",
    "AppleTV3,2": "Apple TV (3rd generation)",
    "AppleTV5,3": "Apple TV (4th generation)",
    "AppleTV6,2": "Apple TV 4K",
    
    //Apple Watch
    "Watch1,1": "Apple Watch (1st generation)",
    "Watch1,2": "Apple Watch (1st generation)",
    "Watch2,6": "Apple Watch Series 1",
    "Watch2,7": "Apple Watch Series 1",
    "Watch2,3": "Apple Watch Series 2",
    "Watch2,4": "Apple Watch Series 2",
    "Watch3,1": "Apple Watch Series 3",
    "Watch3,2": "Apple Watch Series 3",
    "Watch3,3": "Apple Watch Series 3",
    "Watch3,4": "Apple Watch Series 3",
    
    //HomePod
    "AudioAccessory1,1": "HomePod",
    
    //iPad
    "iPad1,1": "iPad",
    "iPad2,1": "iPad 2",
    "iPad2,2": "iPad 2",
    "iPad2,3": "iPad 2",
    "iPad2,4": "iPad 2",
    "iPad3,1": "iPad (3rd generation)",
    "iPad3,2": "iPad (3rd generation)",
    "iPad3,3": "iPad (3rd generation)",
    "iPad3,4": "iPad (4th generation)",
    "iPad3,5": "iPad (4th generation)",
    "iPad3,6": "iPad (4th generation)",
    "iPad4,1": "iPad Air",
    "iPad4,2": "iPad Air",
    "iPad4,3": "iPad Air",
    "iPad5,3": "iPad Air 2",
    "iPad5,4": "iPad Air 2",
    "iPad6,7": "iPad Pro (12.9-inch)",
    "iPad6,8": "iPad Pro (12.9-inch)",
    "iPad6,3": "iPad Pro (9.7-inch)",
    "iPad6,4": "iPad Pro (9.7-inch)",
    "iPad6,11": "iPad (5th generation)",
    "iPad6,12": "iPad (5th generation)",
    "iPad7,1": "iPad Pro (12.9-inch, 2nd generation)",
    "iPad7,2": "iPad Pro (12.9-inch, 2nd generation)",
    "iPad7,3": "iPad Pro (10.5-inch)",
    "iPad7,4": "iPad Pro (10.5-inch)",
    "iPad7,5": "iPad (6th generation)",
    "iPad7,6": "iPad (6th generation)",
    
    //iPad mini
    "iPad2,5": "iPad mini",
    "iPad2,6": "iPad mini",
    "iPad2,7": "iPad mini",
    "iPad4,4": "iPad mini 2",
    "iPad4,5": "iPad mini 2",
    "iPad4,6": "iPad mini 2",
    "iPad4,7": "iPad mini 3",
    "iPad4,8": "iPad mini 3",
    "iPad4,9": "iPad mini 3",
    "iPad5,1": "iPad mini 4",
    "iPad5,2": "iPad mini 4",
    
    //iPhone
    "iPhone1,1": "iPhone 1G",
    "iPhone1,2": "iPhone 3G",
    "iPhone2,1": "iPhone 3GS",
    "iPhone3,1": "iPhone 4",
    "iPhone3,2": "iPhone 4",
    "iPhone4,1": "iPhone 4S",
    "iPhone5,1": "iPhone 5",
    "iPhone5,2": "iPhone 5",
    "iPhone5,3": "iPhone 5C",
    "iPhone5,4": "iPhone 5C",
    "iPhone6,1": "iPhone 5S",
    "iPhone6,2": "iPhone 5S",
    "iPhone7,1": "iPhone 6 Plus",
    "iPhone7,2": "iPhone 6",
    "iPhone8,1": "iPhone 6s",
    "iPhone8,2": "iPhone 6s Plus",
    "iPhone8,4": "iPhone SE",
    "iPhone9,1": "iPhone 7",
    "iPhone9,3": "iPhone 7",
    "iPhone9,2": "iPhone 7 Plus",
    "iPhone9,4": "iPhone 7 Plus",
    "iPhone10,1": "iPhone 8",
    "iPhone10,4": "iPhone 8",
    "iPhone10,2": "iPhone 8 Plus",
    "iPhone10,5": "iPhone 8 Plus",
    "iPhone10,3": "iPhone X",
    "iPhone10,6": "iPhone X",
    "iPhone11,8": "iPhone XR",
    "iPhone11,2": "iPhone XS",
    "iPhone11,4": "iPhone XS Max",
    "iPhone11,6": "iPhone XS Max",
    
    //iPod touch
    "iPod1,1": "iPod touch",
    "iPod2,1": "iPod touch (2nd generation)",
    "iPod3,1": "iPod touch (3rd generation)",
    "iPod4,1": "iPod touch (4th generation)",
    "iPod5,1": "iPod touch (5th generation)",
    "iPod7,1": "iPod touch (6th generation)"
]

extension UIDevice {
    /// EZSwiftExtensions
    public class func idForVendor() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    /// EZSwiftExtensions - Operating system name
    public class func systemName() -> String {
        return UIDevice.current.systemName
    }
    
    /// EZSwiftExtensions - Operating system version
    public class func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    /// EZSwiftExtensions - Operating system version
    public class func systemFloatVersion() -> Float {
        return (systemVersion() as NSString).floatValue
    }
    
    /// EZSwiftExtensions
    public class func deviceName() -> String {
        return UIDevice.current.name
    }
    
    /// EZSwiftExtensions
    public class func deviceLanguage() -> String {
        return Bundle.main.preferredLocalizations[0]
    }
    
    /// EZSwiftExtensions
    public class func deviceModelReadable() -> String {
        return DeviceList[deviceModel()] ?? deviceModel()
    }
    
    /// EZSE: Returns true if the device is iPhone //TODO: Add to readme
    public class func isPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    /// EZSE: Returns true if the device is iPad //TODO: Add to readme
    public class func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    /// EZSwiftExtensions
    public class func deviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machine = systemInfo.machine
        var identifier = ""
        let mirror = Mirror(reflecting: machine)
        
        for child in mirror.children {
            let value = child.value
            
            if let value = value as? Int8, value != 0 {
                identifier.append(String(UnicodeScalar(UInt8(value))))
            }
        }
        
        return identifier
    }
    
    //TODO: Fix syntax, add docs and readme for these methods:
    //TODO: Delete isSystemVersionOver()
    // MARK: - Device Version Checks
    
    public enum Versions: Float {
        case five = 5.0
        case six = 6.0
        case seven = 7.0
        case eight = 8.0
        case nine = 9.0
        case ten = 10.0
        case eleven = 11.0
        case twelve = 12.0
    }
    
    public class func isVersion(_ version: Versions) -> Bool {
        return systemFloatVersion() >= version.rawValue && systemFloatVersion() < (version.rawValue + 1.0)
    }
    
    public class func isVersionOrLater(_ version: Versions) -> Bool {
        return systemFloatVersion() >= version.rawValue
    }
    
    public class func isVersionOrEarlier(_ version: Versions) -> Bool {
        return systemFloatVersion() < (version.rawValue + 1.0)
    }
    
    public class var CURRENT_VERSION: String {
        return "\(systemFloatVersion())"
    }
    
    // MARK: iOS 5 Checks
    
    public class func IS_OS_5() -> Bool {
        return isVersion(.five)
    }
    
    public class func IS_OS_5_OR_LATER() -> Bool {
        return isVersionOrLater(.five)
    }
    
    public class func IS_OS_5_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.five)
    }
    
    // MARK: iOS 6 Checks
    
    public class func IS_OS_6() -> Bool {
        return isVersion(.six)
    }
    
    public class func IS_OS_6_OR_LATER() -> Bool {
        return isVersionOrLater(.six)
    }
    
    public class func IS_OS_6_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.six)
    }
    
    // MARK: iOS 7 Checks
    
    public class func IS_OS_7() -> Bool {
        return isVersion(.seven)
    }
    
    public class func IS_OS_7_OR_LATER() -> Bool {
        return isVersionOrLater(.seven)
    }
    
    public class func IS_OS_7_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.seven)
    }
    
    // MARK: iOS 8 Checks
    
    public class func IS_OS_8() -> Bool {
        return isVersion(.eight)
    }
    
    public class func IS_OS_8_OR_LATER() -> Bool {
        return isVersionOrLater(.eight)
    }
    
    public class func IS_OS_8_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.eight)
    }
    
    // MARK: iOS 9 Checks
    
    public class func IS_OS_9() -> Bool {
        return isVersion(.nine)
    }
    
    public class func IS_OS_9_OR_LATER() -> Bool {
        return isVersionOrLater(.nine)
    }
    
    public class func IS_OS_9_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.nine)
    }
    
    // MARK: iOS 10 Checks
    
    public class func IS_OS_10() -> Bool {
        return isVersion(.ten)
    }
    
    public class func IS_OS_10_OR_LATER() -> Bool {
        return isVersionOrLater(.ten)
    }
    
    public class func IS_OS_10_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.ten)
    }
    
    /// EZSwiftExtensions
    public class func isSystemVersionOver(_ requiredVersion: String) -> Bool {
        switch systemVersion().compare(requiredVersion, options: NSString.CompareOptions.numeric) {
        case .orderedSame, .orderedDescending:
            //println("iOS >= 8.0")
            return true
        case .orderedAscending:
            //println("iOS < 8.0")
            return false
        }
    }
}

#endif
