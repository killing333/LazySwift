//
//  TestViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 19/5/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class TestViewController: UITableViewController {
	let SectionExtension = 0
	let extensions = [ "UIScrollView", ]

	
	
	// MARK: UITableView Data Source
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case SectionExtension:
			return extensions.count
		default:
			return 0
		}
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
		
		switch indexPath.section {
			
		// Extensions
		case SectionExtension:
			cell.textLabel?.text = extensions[indexPath.row]
		default:
			()
		}
		
		return cell
	}

	// MARK: UITableView Delegate
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		switch indexPath.section {
			
		// Extensions
		case SectionExtension:
			switch extensions[indexPath.row] {
			case "UIScrollView":
				navigationController?.pushViewController(TestExtUIScrollViewController(nibName: nil, bundle: nil), animated: true)
			default:
				()
			}
		default:
			()
		}
	}
}
