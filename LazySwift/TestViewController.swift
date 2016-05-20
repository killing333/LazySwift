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
	let extensions = [ "UIScrollView", ]
	

	
	
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
}
