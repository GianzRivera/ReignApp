//
//  Device.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import Foundation
import UIKit

class Device {
    // Base width in point, use iPhone 6
    static let referenceWidth: CGFloat = 320
    static let referenceHeigth: CGFloat = 588

    static var ratio: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeigth = UIScreen.main.bounds.height
        let useWidth = (screenWidth / referenceWidth) < (screenHeigth / referenceHeigth)
        return useWidth ? (screenWidth / referenceWidth) : (screenHeigth / referenceHeigth)
    }

    static var isIphoneBigger: Bool {
        return UIScreen.main.bounds.height >= 812
    }

    static var hasSafeArea: Bool {
        if #available(iOS 11.0, *) {
            guard let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top, topPadding > 24 else {
                return false
            }
        } else {
            return false
        }
        return true
    }

    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            return bottom > 0
        } else {
            // Fallback on earlier versions
            return  false //bottom > 0
        }
     }
}

extension CGFloat {

    var adjusted: CGFloat {
        return (self * Device.ratio).rounded()
    }
}

extension Double {

    var adjusted: CGFloat {
        return (CGFloat(self) * Device.ratio).rounded()
    }
}

extension Int {

    var adjusted: CGFloat {
        return (CGFloat(self) * Device.ratio).rounded()
    }
}
