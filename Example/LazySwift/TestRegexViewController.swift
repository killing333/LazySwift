//
//  TestRegexViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 14/1/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import LazySwift

class TestRegexViewController : UITableViewController {
	var regex: Regex? = nil;
	@IBOutlet var expressionTextField: UITextField!
	@IBOutlet var errorLabel: UILabel!
	@IBOutlet var testStringTextField: UITextField!
	@IBOutlet var matchResultLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		expressionTextField.sendActionsForControlEvents(.EditingChanged)
	}
	
	
	
	
	// MARK: Helper
	func updateUI() {
		matchResultLabel.text = "\(false)"
		
		if regex == nil {
			return
		}
		if testStringTextField.text == nil {
			return
		}
		
		// .match
		let isMatched: Bool = regex!.match(testStringTextField.text!);
		matchResultLabel.text = "\(isMatched)"
	}
	
	
	
	// MARK: Text Field
	@IBAction func expressionTextFieldEditingChanged(sender: UITextField) {
		if sender.text == nil {
			return
		}
		
		do {
			regex = try Regex(pattern: sender.text!)
			errorLabel.text = nil
			updateUI()
		} catch let error as NSError {
			errorLabel.text = error.localizedDescription
		} catch {
			errorLabel.text = "Unknown error"
		}
	}
	@IBAction func testStringTextFieldEditingChanged(sender: UITextField) {
		if sender.text == nil {
			return
		}

		updateUI()
	}
	
}
