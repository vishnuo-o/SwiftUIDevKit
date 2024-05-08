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
    public static let name = UIDevice.current.name
    public static let model = UIDevice.current.model
    public static let version = UIDevice.current.systemVersion
    ///Device Type
    public static var is_iPhone: Bool { return UIDevice.current.userInterfaceIdiom == .phone }
    public static var is_iPad: Bool { return UIDevice.current.userInterfaceIdiom == .pad }
    ///Device frame
    public static var height: CGFloat { return UIScreen.main.bounds.height }
    public static var width: CGFloat { return UIScreen.main.bounds.width }
}

