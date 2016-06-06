//
//  CGPoint+Lazy.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 6/6/2016.
//
//

import Foundation
import UIKit

public extension CGPoint {
	
}

public func + (left: CGPoint, right: CGPoint) -> CGPoint {
	return CGPoint(x: left.x + right.x, y: left.y + right.y)
}
public func += (inout left: CGPoint, right: CGPoint) {
	return left = left + right
}
