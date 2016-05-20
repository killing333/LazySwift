//
//  LazyStackView.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 20/5/2016.
//
//

import UIKit

@objc public enum LazyStackViewAlignment: Int {
	/**
		Upcoming child views would be added on the right
	*/
	case TopLeft
	/**
		Upcoming child views would be added on the left
	*/
	case Right
	/**
		Upcoming child views would be added at the bottom
	*/
	case Top
	/**
		Upcoming child views would be added at the top
	*/
	case Bottom
}

/**
	UIStackView like alternative
*/
public class LazyStackView: UIView {
	private var arrangedViews: [UIView] = []
//	private var arrangedViewsMaxWidth: CGFloat = 0
//	private var arrangedViewsMaxHeight: CGFloat = 0
//	private var nextPosition: CGPoint = CGPointZero

	/**
		Alignment of the child views
	*/
	public var alignment: LazyStackViewAlignment {
		didSet {
			realignViewsFromIndex(0)
		}
	}
	/**
		Interval between subviews
	*/
	public var interval: CGFloat = 0
	
	
	override init(frame: CGRect) {
		alignment = .TopLeft

		super.init(frame: frame)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
	// MARK: Override
	public override func intrinsicContentSize() -> CGSize {
		print("super.intrinsicContentSize(): \(super.intrinsicContentSize())")
		
		return super.intrinsicContentSize()
	}
	
	
	// MARK: Helper
	/**
		Add view as the last arranged view only if it is not already added
	*/
	public func addView(view: UIView) -> Bool {
		if arrangedViews.contains(view) {
			return false
		}
		
		self.addSubview(view)
		arrangedViews.append(view)
		self.realignViewsFromIndex(arrangedViews.count - 1)
		
		return true
	}
	
	public func removeView(view: UIView) -> Bool {
		guard let index = arrangedViews.indexOf(view) else {
			return false
		}
		
		let view = arrangedViews.removeAtIndex(index)
		view.removeFromSuperview()
		
		// Realign upcoming views
		if index < arrangedViews.count {
			realignViewsFromIndex(index)
		} else {
			resize()
		}

		return true
	}
	
	/**
		Realign children starting from certain index
		- parameter index: Certain index
	*/
	private func realignViewsFromIndex(index: Int) -> Void {
		print("Realign view at \(index)")
		if index < 0 || index >= arrangedViews.count {
			print("  Invalid index \(index)")
			return
		}
		
		// Realign upcoming views
		var lastView: UIView?
		for i in index...arrangedViews.count-1 {
			print("  Loop index \(i)")
			var point = CGPointZero
			let view = arrangedViews[i]
			lastView = ( i - 1 >= 0 ? arrangedViews[i - 1] : nil )
			
			// Set position
			if alignment == .TopLeft {
				point.x = ( lastView == nil ? 0 : lastView!.frame.maxX + interval )
				point.y = 0
				
				view.frame.origin = point
			}
		}
		
		resize()
	}
	/**
		Resize self
	*/
	func resize() -> Void {
		let lastView: UIView? = ( arrangedViews.count > 0 ? arrangedViews[arrangedViews.count - 1] : nil )
		if alignment == .TopLeft {
			frame.size.width = lastView?.frame.maxX ?? 0
			print("Realigned. Frame: \(frame)")
		}
	}
}
