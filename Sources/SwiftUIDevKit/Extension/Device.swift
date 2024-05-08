//
//  Device.swift
//
//
//  Created by Vishnu Priyan on 4/12/24.
//

import SwiftUI

// MARK: - Device Details
extension UIDevice{
    ///Decvice Details
    static let name = UIDevice.current.name
    static let model = UIDevice.current.model
    static let version = UIDevice.current.systemVersion
    ///Device Type
    static var is_iPhone: Bool { return UIDevice.current.userInterfaceIdiom == .phone }
    static var is_iPad: Bool { return UIDevice.current.userInterfaceIdiom == .pad }
    ///Device frame
    static var height: CGFloat { return UIScreen.main.bounds.height }
    static var width: CGFloat { return UIScreen.main.bounds.width }
}

