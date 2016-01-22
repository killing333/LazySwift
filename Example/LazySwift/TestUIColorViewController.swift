//
//  TestUIColorViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 13/1/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import LazySwift

class TestUIColorViewController: UITableViewController {
	@IBOutlet var redSlider: UISlider!
	@IBOutlet var redSliderLabel: UILabel!
	@IBOutlet var greenSlider: UISlider!
	@IBOutlet var greenSliderLabel: UILabel!
	@IBOutlet var blueSlider: UISlider!
	@IBOutlet var blueSliderLabel: UILabel!
	@IBOutlet var alphaSlider: UISlider!
	@IBOutlet var alphaSliderLabel: UILabel!
	@IBOutlet var resultView: UIView!
	
	@IBOutlet var hexTextField: UITextField!
	@IBOutlet var alphaSlider2: UISlider!
	@IBOutlet var alphaSliderLabel2: UILabel!
	@IBOutlet var resultView2: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		redSlider.sendActionsForControlEvents(UIControlEvents.ValueChanged)
		greenSlider.sendActionsForControlEvents(UIControlEvents.ValueChanged)
		blueSlider.sendActionsForControlEvents(UIControlEvents.ValueChanged)
		alphaSlider.sendActionsForControlEvents(UIControlEvents.ValueChanged)
		alphaSlider2.sendActionsForControlEvents(.ValueChanged);
	}
	
	
	
	
	// MARK: Helper
	func updateResultView() {
		resultView.backgroundColor = UIColor(redInt: Int(redSlider.value), greenInt: Int(greenSlider.value), blueInt: Int(blueSlider.value), alpha: CGFloat(alphaSlider.value))

	}
	func updateResultView2() {
		guard let regex: Regex = try? Regex(pattern: "[0-9A-F]{6}", options: .CaseInsensitive) else {
			return
		}
		
		guard let hexString: String = hexTextField.text! else {
			return
		}
		
		if regex.match(hexTextField.text!) {
			resultView2.backgroundColor = UIColor(hex: Int(hexString, radix: 16)!, alpha: CGFloat(alphaSlider2.value))
		}
	}
	
	
	
	// MARK: Slider
	@IBAction func redSliderValueChanged(sender: UISlider) {
		redSliderLabel.text = "\(Int(sender.value))"
		updateResultView()
	}
	@IBAction func greenSliderValueChanged(sender: UISlider) {
		greenSliderLabel.text = "\(Int(sender.value))"
		updateResultView()
	}
	@IBAction func blueSliderValueChanged(sender: UISlider) {
		blueSliderLabel.text = "\(Int(sender.value))"
		updateResultView()
	}
	@IBAction func alphaSliderValueChanged(sender: UISlider) {
		alphaSliderLabel.text = String(format: "%.3f", sender.value)
		updateResultView()
	}
	@IBAction func alphaSlider2ValueChanged(sender: UISlider) {
		alphaSliderLabel2.text = String(format: "%.3f", sender.value)
		updateResultView2()
	}
	
	
	
	
	// MARK: Text Field
	@IBAction func hexTextFieldDidEndOnExit(sender: UITextField) {
		
	}
	@IBAction func hexTextFieldEditingChanged(sender: UITextField) {
		if sender.text == nil {
			return
		}
		updateResultView2()
	}
}

