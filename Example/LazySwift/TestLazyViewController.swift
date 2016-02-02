//
//  TestLazyViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 1/2/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import LazySwift

class TestLazyViewController: UITableViewController {
	@IBOutlet var screenSizeLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		screenSizeLabel.text = "\(screenSize())"
	}
}
