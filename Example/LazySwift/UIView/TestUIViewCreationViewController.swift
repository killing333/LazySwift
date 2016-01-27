//
//  TestUIViewCreationViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 27/1/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import LazySwift

class TestUIViewCreationViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let view: TestView = TestView.create()
		view.center = self.view.center
		view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
		self.view.addSubview(view)
		
	}
}
