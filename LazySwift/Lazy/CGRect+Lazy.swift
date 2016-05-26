//
//  CGRect+Lazy.swift
//  MGIA
//
//  Created by Ho Lun Wan on 25/5/2016.
//  Copyright © 2016 Wonderful World Group Limited. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
	/**
		Snap this rectangle at certain center
		- parameter point: Center
	*/
	func centerAt(point: CGPoint) -> CGRect {
		return CGRect(x: point.x - width/2, y: point.y - height/2, width: width, height: height)
	}
	/**
		Snap this rectangle at certain center X, keeping center Y unchanged
		- parameter x: X coordinate of the new center
	*/
	func centerAtX(x: CGFloat) -> CGRect {
		return centerAt(CGPoint(x: x, y: midY))
	}
	/**
		Snap this rectangle at certain center Y, keeping center X unchanged
		- parameter y: Y coordinate of the new center
	*/
	func centerAtY(y: CGFloat) -> CGRect {
		return centerAt(CGPoint(x: midX, y: y))
	}
	
	
	/**
		Snap this rectangle to particular position of target rectangle, which postiion (0,0) means top left and position (1, 1) means bottom right
		- parameter position: (0,0) means top left, (1, 1) means bottom right. Can beyond range 0-1
	*/
	func snapTo(rect: CGRect, position: (CGFloat, CGFloat)) -> CGRect {
		let (positionX, positionY) = position
		
		return CGRect(origin: CGPoint(x: rect.minX + (rect.width - width) * positionX, y: rect.minY + (rect.height - height) * positionY), size: size)
	}
	enum CGRectSnapPosition {
		case TopLeft
		case Top
		case TopRight
		case Right
		case BottomRight
		case Bottom
		case BottomLeft
		case Left
		case Center
	}
	func snapTo(rect: CGRect, position: CGRectSnapPosition) -> CGRect {
		var pos: (CGFloat, CGFloat) = (0.5, 0.5)
		switch position {
		case .TopLeft:
			pos = (0, 0)
		case .Top:
			pos = (0.5, 0)
		case .TopRight:
			pos = (1, 0)
		case .Left:
			pos = (0, 0.5)
		case .Center:
			pos = (0.5, 0.5)
		case .Right:
			pos = (1, 0.5)
		case .BottomLeft:
			pos = (0, 1)
		case .Bottom:
			pos = (0.5, 1)
		case .BottomRight:
			pos = (1, 1)
		}
		return snapTo(rect, position: pos)
	}
	
	struct CGRectDimension: OptionSetType {
		let rawValue: Int
		init(rawValue: Int) { self.rawValue = rawValue }
		
		static let Width = CGRectDimension(rawValue: 1)
		static let Height = CGRectDimension(rawValue: 2)
		static let All: CGRectDimension = [ .Width, .Height ]
	}
	/**
		Expand or compress this rectangle from center
	*/
	func expand(dimension: CGRectDimension, length:CGFloat) -> CGRect {
		var rect = self
		
		if dimension.contains(.Width) {
			rect = CGRect(x: rect.midX - length/2, y: rect.minY, width: length, height: rect.height)
		}
		
		if dimension.contains(.Height) {
			rect = CGRect(x: rect.minX, y: rect.midY - length/2, width: rect.width, height: length)
		}
		
		return rect
	}
}