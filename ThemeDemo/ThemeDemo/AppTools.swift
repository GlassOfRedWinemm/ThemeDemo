//
//  AppTools.swift
//  ThemeDemo
//
//  Created by Yuezhen Pan on 2025/3/13.
//

import UIKit

// 定义一个自定义的颜色模式枚举
public enum ColorMode: Int {
    case followSystem
    case light
    case dark
}

@objcMembers
class AppTools: NSObject {
    static let shared = AppTools()
    let styleSwichNotification = "StyleSwichNotification"
    
    private static let colorModeKey = "ColorModeKey"
    
    static var style: ColorMode {
        get {
            if let rawValue = UserDefaults.standard.value(forKey: colorModeKey) as? Int {
                return ColorMode(rawValue: rawValue) ?? .followSystem
            }
            return .followSystem
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: colorModeKey)
            UserDefaults.standard.synchronize()
        }
    }
}
