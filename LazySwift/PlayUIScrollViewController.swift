//
//  PlayUIScrollViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 6/6/2016.
//
//

import UIKit

let testScrollViewFixedHeader			= "Fixed Header in UIScrollView"
let testTableViewFixedHeader			= "Fixed Header in UITableView"
class PlayUIScrollViewController: UITableViewController {
	
	// Constant
	let playSection					= [ testScrollViewFixedHeader,
	               					    testTableViewFixedHeader, ]
	
	// Var
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "UIScrollView"
		tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return playSection.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
		
		cell.accessoryType = .DisclosureIndicator
		cell.textLabel?.font = UIFont(name: "Avenir", size: 16)
		cell.detailTextLabel?.font = UIFont(name: "Avenir", size: 16)
		cell.textLabel?.text = playSection[indexPath.row]
		
		return cell
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		switch playSection[indexPath.row] {
		case testScrollViewFixedHeader:
			navigationController?.pushViewController(PlayUIScrollViewFixedHeaderViewController(nibName: nil, bundle: nil), animated: true)
		case testTableViewFixedHeader:
			navigationController?.pushViewController(PlayUITableViewFixedHeaderViewController(nibName: nil, bundle: nil), animated: true)
		default:
			()
		}
	}
}
