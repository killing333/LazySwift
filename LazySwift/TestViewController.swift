//
//  TestViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 19/5/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit


let sectionNameExtensions			= "Extensions"
let sectionNameLazy					= "Lazies"
let sectionNamePlayground			= "Playground"
class TestViewController: UITableViewController {

	let sections = [ sectionNameExtensions,
	                 sectionNameLazy,
	                 sectionNamePlayground, ]
	let lazies = [ "LazyStackView", ]
	let extensions = [ "CGRect",
	                   "UIScrollView", ]
	let playground = [ "UIScrollView", ]


	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "LazySwift"
	}


	// MARK: UITableView Data Source
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return sections.count
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch sections[section] {
		case sectionNameExtensions:
			return extensions.count
		case sectionNameLazy:
			return lazies.count
		case sectionNamePlayground:
			return playground.count
		default:
			return 0
		}
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

		switch sections[indexPath.section] {

		// Extensions
		case sectionNameExtensions:
			cell.textLabel?.text = extensions[indexPath.row]
		case sectionNameLazy:
			cell.textLabel?.text = lazies[indexPath.row]
		case sectionNamePlayground:
			cell.textLabel?.text = playground[indexPath.row]
		default:
			()
		}

		return cell
	}

	// MARK: UITableView Delegate
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		switch sections[indexPath.section] {

		// Extensions
		case sectionNameExtensions:
			switch extensions[indexPath.row] {
			case "CGRect":
				navigationController?.pushViewController(TestExtCGRectViewController(nibName: nil, bundle: nil), animated: true)
			case "UIScrollView":
				navigationController?.pushViewController(TestExtUIScrollViewController(nibName: nil, bundle: nil), animated: true)
			default:
				()
			}
		case sectionNameLazy:
			switch lazies[indexPath.row] {
			case "LazyStackView":
				navigationController?.pushViewController(TestLazyStackViewController(nibName: nil, bundle: nil), animated: true)
			default:
				()
			}
		case sectionNamePlayground:
			switch playground[indexPath.row] {
			case "UIScrollView":
				navigationController?.pushViewController(PlayUIScrollViewController(nibName: nil, bundle: nil), animated: true)
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
