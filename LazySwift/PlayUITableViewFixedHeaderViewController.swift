//
//  PlayUITableViewFixedHeaderViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 6/6/2016.
//
//

import UIKit

class PlayUITableViewFixedHeaderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	// Constant
	var headerViewMinHeight: CGFloat		= 60
	var headerViewMaxHeight: CGFloat		= 120
	
	// Var
	var rows: [String]						= []
	
	var scrollView: UIScrollView!
	var scrollContentView: UIView!
	var headerView: UIView!
	var tableView: UITableView!
	
	
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
		
		tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 480), style: .Plain)
		tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.dataSource = self
		tableView.delegate = self
		tableView.autoresizingMask = [ .FlexibleWidth, .FlexibleHeight, ]
		view.addSubview(tableView)
		tableView.snp_makeConstraints { (make) in
			make.top.equalTo(snp_topLayoutGuideBottom)
			make.left.right.equalToSuperview()
			make.bottom.equalTo(snp_bottomLayoutGuideTop)
		}
		scrollView = tableView
		
		headerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: headerViewMaxHeight))
		headerView.backgroundColor = UIColor(hue: 0, saturation: 0.2, brightness: 1, alpha: 1)
		headerView.autoresizingMask = [ .FlexibleWidth, .FlexibleBottomMargin ]
		tableView.addSubview(headerView)
		tableView.contentInset = UIEdgeInsets(top: headerViewMaxHeight, left: 0, bottom: 0, right: 0)
	}
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		headerView.frame.origin.y = scrollView.contentOffset.y
		tableView.contentInset = UIEdgeInsets(top: headerViewMaxHeight, left: 0, bottom: 0, right: 0)
		tableView.scrollIndicatorInsets = UIEdgeInsets(top: headerViewMaxHeight, left: 0, bottom: 0, right: 0)
	}
	
	
	
	// MARK: UIScrollViewDelegate
	func scrollViewDidScroll(scrollView: UIScrollView) {
		print("scrollView.contentOffset: \(scrollView.contentOffset)")
		let scrollOffset = scrollView.contentOffset + CGPoint(x: 0, y: scrollView.contentInset.top)
		print("Adjusted Offset: \(scrollOffset)")
		
		if scrollOffset.y >= 0 {
			headerView.frame.origin.y = scrollView.contentOffset.y
			
			if headerView.frame.height > headerViewMinHeight {
				let offset: CGFloat = min(headerView.frame.height - headerViewMinHeight, scrollOffset.y);
				print("v offset: \(offset)")
				headerView.frame.size.height -= offset;
				
				// Update content inset
				var insets = scrollView.contentInset
				insets.top = headerView.frame.height
				scrollView.contentInset = insets
				scrollView.scrollIndicatorInsets = insets
			}
		}

		else {
			if headerView.frame.height < headerViewMaxHeight {
				let offset: CGFloat = min(headerViewMaxHeight - headerView.frame.height, -scrollOffset.y);
				print("^ offset: \(offset)")
				
				headerView.frame.size.height += offset;

				// Update content inset
				var insets = scrollView.contentInset
				insets.top = headerView.frame.height
				scrollView.contentInset = insets
				scrollView.scrollIndicatorInsets = insets

				headerView.frame.origin.y = scrollView.contentOffset.y
			}
			
			else {
				headerView.frame.origin.y = -headerViewMaxHeight
			}
		}
	}
	
	
	
	// MARK: UITableViewDataSource
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return rows.count
	}
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
		
		cell.textLabel?.font = UIFont(name: "Avenir", size: 16)
		cell.detailTextLabel?.font = UIFont(name: "Avenir", size: 16)
		cell.textLabel?.text = rows[indexPath.row]
		
		return cell
	}
}
