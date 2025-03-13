//
//  UIColorExtend.swift
//  ThemeDemo
//
//  Created by Yuezhen Pan on 2025/3/11.
//

import Foundation
import UIKit

public extension UIColor {
    static func color(lightMode: UIColor, darkMode: UIColor, mode: ColorMode = .followSystem) -> UIColor {
        switch mode {
        case .followSystem:
            // 如果是跟随系统模式
            guard #available(iOS 13.0, *) else { return lightMode }
            return UIColor { (traitCollection) -> UIColor in
                return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
            }
        case .light:
            // 如果是浅色模式，直接返回浅色模式的颜色
            return lightMode
        case .dark:
            // 如果是暗色模式，直接返回暗色模式的颜色
            return darkMode
        }
    }
}
