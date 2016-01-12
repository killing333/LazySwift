//
//  CGPoint+Lazy.swift
//  Pods
//
//  Created by Ho Lun Wan on 11/1/2016.
//
//

import Foundation

public extension CGPoint {
	
}

/**
	Negate the CGPoint
*/
public prefix func -(point: CGPoint) -> CGPoint {
	return CGPoint(x: -point.x, y: -point.y)
}


// MARK: Addition
/**
	Addition between two CGPoint
*/
public func +(left: CGPoint, right: CGPoint) -> CGPoint {
	return CGPoint(x: left.x + right.x, y: left.y + right.y)
}
public func +=(inout left: CGPoint, right: CGPoint) {
	left = left + right
}

/**
	Addition of a CGFloat to a CGPoint
*/
public func +(left: CGPoint, right: CGFloat) -> CGPoint {
	return CGPoint(x: left.x + right, y: left.y + right)
}
public func +=(inout left: CGPoint, right: CGFloat) {
	left = left + right
}


// MARK: Difference
/**
	Difference between two CGPoint
*/
public func -(left: CGPoint, right: CGPoint) -> CGPoint {
	return CGPoint(x: left.x - right.x, y: left.y - right.y)
}
public func -=(inout left: CGPoint, right: CGPoint) {
	left = left - right
}

/**
	Subtraction of a CGFloat from a CGPoint
*/
public func -(left: CGPoint, right: CGFloat) -> CGPoint {
	return CGPoint(x: left.x - right, y: left.y - right)
}
public func -=(inout left: CGPoint, right: CGFloat) {
	left = left - right
}


// MARK: Multiplication
public func *(left: CGPoint, right: CGFloat) -> CGPoint {
	return CGPoint(x: left.x * right, y: left.y * right)
}
public func *=(inout left: CGPoint, right: CGFloat) {
	left = left * right
}


// MARK: Division
public func /(left: CGPoint, right: CGFloat) -> CGPoint {
	return CGPoint(x: left.x / right, y: left.y / right)
}
public func /=(inout left: CGPoint, right: CGFloat) {
	left = left / right
}
