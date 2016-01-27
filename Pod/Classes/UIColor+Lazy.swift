//
//  UIColor+Lazy.swift
//  Pods
//
//  Created by Ho Lun Wan on 13/1/2016.
//
//

import Foundation

public extension UIColor {
	/**
	Create color using scale 0 - 255. Alpha remains from 0 - 1
	- Parameter redInt:			Red component, from 0 to 255
	- Parameter greenInt:		Green component, from 0 to 255
	- Parameter blueInt:		Blue component, from 0 to 255
	- Parameter alpha:			Alpha component, from 0 to 1
	*/
	public convenience init(redInt: Int, greenInt: Int, blueInt: Int, alpha: CGFloat = 1) {
		self.init(red: CGFloat(redInt)/255.0, green: CGFloat(greenInt)/255.0, blue: CGFloat(blueInt)/255.0, alpha: alpha)
	}

	/**
	Create color using hex. Alpha remains from 0 - 1
	- Parameter hex:			HTML hex format for color
	- Parameter alpha:			Alpha component, from 0 to 1
	*/
	public convenience init(hex: Int, alpha: CGFloat = 1) {
		self.init(redInt: Int((hex>>16) & 0xFF), greenInt: Int((hex>>8) & 0xFF), blueInt: Int((hex>>0) & 0xFF), alpha: alpha)
	}
}