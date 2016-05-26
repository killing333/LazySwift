//
//  UIColor+Lazy.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 26/5/2016.
//
//

import Foundation
import UIKit

extension UIColor {
	/**
		Create color from hex
		http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios
	*/
	convenience init(netHex: Int, alpha: CGFloat) {
		self.init(red: CGFloat((netHex >> 16) & 0xff) / 255.0, green: CGFloat((netHex >> 8) & 0xff) / 255.0, blue: CGFloat(netHex & 0xff) / 255.0, alpha: alpha)
	}
}