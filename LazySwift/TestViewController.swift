//
//  TestViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 19/5/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

let TestViewSectionNameExtensions = "Extensions"
let TestViewSectionNameLazy = "Lazies"

class TestViewController: UITableViewController {
	
	let sections = [ TestViewSectionNameExtensions,
	                 TestViewSectionNameLazy, ]
	let lazies = [ "LazyStackView", ]
	let extensions = [ "CGRect",
	                   "UIScrollView", ]
	

	
	
	// MARK: UITableView Data Source
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return sections.count
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch sections[section] {
		case TestViewSectionNameExtensions:
			return extensions.count
		case TestViewSectionNameLazy:
			return lazies.count
		default:
			return 0
		}
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
		
		switch sections[indexPath.section] {
			
		// Extensions
		case TestViewSectionNameExtensions:
			cell.textLabel?.text = extensions[indexPath.row]
		case TestViewSectionNameLazy:
			cell.textLabel?.text = lazies[indexPath.row]
		default:
			()
		}
		
		return cell
	}

	// MARK: UITableView Delegate
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		switch sections[indexPath.section] {
			
		// Extensions
		case TestViewSectionNameExtensions:
			switch extensions[indexPath.row] {
			case "CGRect":
				navigationController?.pushViewController(TestExtCGRectViewController(nibName: nil, bundle: nil), animated: true)
			case "UIScrollView":
				navigationController?.pushViewController(TestExtUIScrollViewController(nibName: nil, bundle: nil), animated: true)
			default:
				()
			}
		case TestViewSectionNameLazy:
			switch lazies[indexPath.row] {
			case "LazyStackView":
				navigationController?.pushViewController(TestLazyStackViewController(nibName: nil, bundle: nil), animated: true)
			default:
				()
			}
		default:
			()
		}
	}
	
	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let container = UIView(frame: CGRectZero)
		
		let label = UILabel(frame: CGRectZero)
		label.font = UIFont(name: "Avenir-Medium", size: 14)
		label.text = sections[section]
		container.addSubview(label)
		label.snp_makeConstraints { (make) in
			make.edges.equalTo(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
		}
		
		return container
	}
}
