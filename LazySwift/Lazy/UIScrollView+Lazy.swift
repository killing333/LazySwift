//
//  UIScrollView+Lazy.swift
//  Pods
//
//  Created by Ho Lun Wan on 19/5/2016.
//
//

import Foundation
import UIKit

@objc public enum UIScrollViewScrollPosition: Int {
	case Center
	case Top
	case Left
	case Bottom
	case Right
	case TopLeft
	case TopRight
	case BottomLeft
	case BottomRight
}

public extension UIScrollView {
	
	/**
	Scroll to particular border/corner
	*/
	public func scrollTo(position: UIScrollViewScrollPosition, animated: Bool) -> Void {
		let scrollableSize = CGSize(width: max(0, contentInset.left + contentSize.width + contentInset.right - bounds.width),
									height: max(0, contentInset.top + contentSize.height + contentInset.bottom - bounds.height))
		var offset: CGPoint = CGPointZero
		
		switch position {
		case .Center:
			offset = CGPoint(x: scrollableSize.width/2, y: scrollableSize.height/2)
		case .Top:
			offset = CGPoint(x: scrollableSize.width/2, y: 0)
		case .Left:
			offset = CGPoint(x: 0, y: scrollableSize.height/2)
		case .Bottom:
			offset = CGPoint(x: scrollableSize.width/2, y: scrollableSize.height)
		case .Right:
			offset = CGPoint(x: scrollableSize.width, y: scrollableSize.height/2)
		case .TopLeft:
			offset = CGPoint(x: 0, y: 0)
		case .TopRight:
			offset = CGPoint(x: scrollableSize.width, y: 0)
		case .BottomLeft:
			offset = CGPoint(x: 0, y: scrollableSize.height)
		case .BottomRight:
			offset = CGPoint(x: scrollableSize.width, y: scrollableSize.height)
		}
		
		// Adjust due to content inset
		offset.x -= contentInset.left
		offset.y -= contentInset.top
		
		setContentOffset(offset, animated: animated)
	}
}