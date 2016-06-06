//
//  PlayUIScrollViewFixedHeaderViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 6/6/2016.
//
//

import UIKit

class PlayUIScrollViewFixedHeaderViewController: UIViewController, UIScrollViewDelegate {
	
	// Constant
	var headerViewMinHeight: CGFloat		= 60
	var headerViewMaxHeight: CGFloat		= 120
	
	// Var
	var rows: [String]						= []
	
	var scrollView: UIScrollView!
	var scrollContentView: UIView!
	var headerView: UIView!
	
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		title = "Fixed Header in UITableView"
		for i in (0..<50) {
			rows.append("Row \(i)")
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func loadView() {
		view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
		view.backgroundColor = UIColor.whiteColor()
		
		scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
		scrollView.delegate = self
		scrollView.autoresizingMask = [ .FlexibleWidth, .FlexibleHeight, ]
		view.addSubview(scrollView)
		scrollView.snp_makeConstraints { (make) in
			make.left.top.right.equalToSuperview()
			make.bottom.equalTo(snp_bottomLayoutGuideTop)
		}

		scrollContentView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 900))
		scrollContentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
		scrollContentView.autoresizingMask = [ .FlexibleWidth, ]
		scrollView.addSubview(scrollContentView)
		scrollView.contentSize = CGSize(width: 320, height: 900)
		
		headerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: headerViewMaxHeight))
		headerView.backgroundColor = UIColor(hue: 0, saturation: 0.2, brightness: 1, alpha: 1)
		headerView.autoresizingMask = [ .FlexibleWidth, .FlexibleBottomMargin ]
		scrollContentView.addSubview(headerView)
	}
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		scrollViewDidScroll(scrollView)
	}
	
	
	
	// MARK: Setter
	func setHeaderY(y: CGFloat) -> Void {
		headerView.frame.origin.y = y + topLayoutGuide.length
	}
	
	
	
	
	// MARK: Helper
	func updateScrollViewInsets() -> Void {
		var insets = scrollView.contentInset
		insets.top = headerView.frame.height + topLayoutGuide.length
		scrollView.contentInset = insets
		scrollView.scrollIndicatorInsets = insets
	}
	
	
	
	// MARK: UIScrollViewDelegate
	func scrollViewDidScroll(scrollView: UIScrollView) {
		let scrollOffset = scrollView.contentOffset + CGPoint(x: 0, y: scrollView.contentInset.top)
		
		// Scrolling down
		if scrollOffset.y >= 0 {
			setHeaderY(scrollView.contentOffset.y)
			
			if headerView.frame.height > headerViewMinHeight {
				// Header view adjustment must not exceed min height
				let offset: CGFloat = min(headerView.frame.height - headerViewMinHeight, scrollOffset.y);
				headerView.frame.size.height -= offset;
				
				updateScrollViewInsets()
			}
		}
			
		// Scrolling up
		else {
			if headerView.frame.height < headerViewMaxHeight {
				// Header view adjustment must not exceed max height
				let offset: CGFloat = min(headerViewMaxHeight - headerView.frame.height, -scrollOffset.y);
				headerView.frame.size.height += offset;

				updateScrollViewInsets()
				setHeaderY(scrollView.contentOffset.y)
			}
				
			else {
				setHeaderY(-(headerViewMaxHeight + topLayoutGuide.length))
			}
		}
	}
}
