//
//  TestExtCGRectViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 26/5/2016.
//
//

import UIKit

class TestExtCGRectViewController: UIViewController {
	var canvasView: UIView!
	var controllScrollView: UIScrollView!
	var view1: UIView!
	var view2: UIView!
	var controlContainer: UIView!

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
		view.backgroundColor = UIColor.whiteColor()
		
		// Canvas
		canvasView = UIView(frame: CGRect(x: 0, y: topLayoutGuide.length, width: 320, height: 200))
		canvasView.backgroundColor = UIColor(white: 0.95, alpha: 1)
		view.addSubview(canvasView)
		canvasView.snp_makeConstraints { (make) in
			make.top.equalTo(snp_topLayoutGuideBottom)
			make.left.right.equalToSuperview()
			make.height.equalTo(260)
		}

		view1 = UIView(frame: CGRect(x: 60, y: 20, width: 200, height: 160))
		view1.autoresizingMask = [ .FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleTopMargin, .FlexibleBottomMargin, ]
		view1.backgroundColor = UIColor(hue: 0, saturation: 0.3, brightness: 1, alpha: 1)
		canvasView.addSubview(view1)

		view2 = UIView(frame: CGRect(x: 30, y: 40, width: 100, height: 80))
		view2.backgroundColor = UIColor(hue: 0.2, saturation: 0.3, brightness: 1, alpha: 1)
		canvasView.addSubview(view2)

		// Controll scroll view
		controllScrollView = UIScrollView(frame: CGRect(x: 0, y: 200, width: 320, height: 280))
		view.addSubview(controllScrollView)
		controllScrollView.snp_makeConstraints { (make) in
			make.top.equalTo(canvasView.snp_bottom)
			make.left.right.equalToSuperview()
			make.bottom.equalTo(snp_bottomLayoutGuideTop)
		}
		
		controlContainer = UIView(frame: CGRect(x: 0, y: 200, width: 320, height: 280))
		controllScrollView.addSubview(controlContainer)
		controlContainer.snp_makeConstraints { (make) in
			make.edges.width.equalToSuperview()
		}

		let snapContainer = configSnapButtons()
		controlContainer.addSubview(snapContainer)
		snapContainer.snp_makeConstraints { (make) in
			make.left.top.right.equalToSuperview()
		}

		let fitContainer = configFitButtons()
		controlContainer.addSubview(fitContainer)
		fitContainer.snp_makeConstraints { (make) in
			make.top.equalTo(snapContainer.snp_bottom)
			make.left.right.equalToSuperview()
		}
		
		let resetButton = UIButton(type: .System)
		resetButton.titleLabel?.font = UIFont(name: "Avenir", size: 22)
		resetButton.setTitle("Reset frame", forState: .Normal)
		resetButton.addTarget(self, action: #selector(TestExtCGRectViewController.touchResetButton(_:)), forControlEvents: .TouchUpInside)
		controlContainer.addSubview(resetButton)
		resetButton.snp_makeConstraints { (make) in
			make.top.equalTo(fitContainer.snp_bottom).offset(13)
			make.centerX.bottom.equalToSuperview()
		}
	}
	func configSnapButtons() -> UIView {
		let container = UIView(frame: CGRectZero)
		
		let label = UILabel(frame: CGRectZero)
		label.textAlignment = .Center
		label.numberOfLines = 0
		label.font = UIFont(name: "Avenir", size: 16)
		label.text = "CGRect.snapTo(rect: CGRect, position: CGRectSnapPosition)"
		container.addSubview(label)
		label.snp_makeConstraints { (make) in
			make.left.top.right.equalToSuperview().inset(UIEdgeInsets(top: 6, left: 13, bottom: 6, right: 13))
		}

		let snapButtonContainer = UIView(frame: CGRectZero)
		container.addSubview(snapButtonContainer)
		snapButtonContainer.snp_makeConstraints { (make) in
			make.top.equalTo(label.snp_bottom).offset(6)
			make.centerX.bottom.equalToSuperview()
		}

		// Create buttons
		let buttonsMatrix = [ [ "◤", "▲", "◥", ],
		                      [ "◀", "◉", "▶", ],
		                      [ "◣", "▼", "◢", ], ]
		var index = 0
		var topButton: UIButton?
		for buttonsRow in buttonsMatrix {
			var leftButton: UIButton?

			for buttonText in buttonsRow {
				let button = UIButton(type: .System)
				button.titleLabel?.font = UIFont(name: "Avenir", size: 22)
				button.setTitle(buttonText, forState: .Normal)
				button.addTarget(self, action: #selector(TestExtCGRectViewController.touchSnapButton(_:)), forControlEvents: .TouchUpInside)
				button.tag = index
				snapButtonContainer.addSubview(button)
				button.snp_makeConstraints(closure: { (make) in
					if topButton == nil {
						make.top.equalToSuperview()
					} else {
						make.top.equalTo(topButton!.snp_bottom)
					}
					if leftButton == nil {
						make.left.equalToSuperview()
					} else {
						make.left.equalTo(leftButton!.snp_right)
					}
					make.size.equalTo(CGSize(width: 44, height: 44))
				})
				leftButton = button
				index += 1
			}

			leftButton?.snp_makeConstraints(closure: { (make) in
				make.right.equalToSuperview()
			})
			topButton = leftButton
		}
		topButton?.snp_makeConstraints(closure: { (make) in
			make.bottom.equalToSuperview()
		})
		
		return container
	}
	func configFitButtons() -> UIView {
		let container = UIView(frame: CGRectZero)
		
		let label = UILabel(frame: CGRectZero)
		label.textAlignment = .Center
		label.numberOfLines = 0
		label.font = UIFont(name: "Avenir", size: 16)
		label.text = "CGRect.snapTo(rect: CGRect, position: CGRectSnapPosition)"
		container.addSubview(label)
		label.snp_makeConstraints { (make) in
			make.left.top.right.equalToSuperview().inset(UIEdgeInsets(top: 6, left: 13, bottom: 6, right: 13))
		}
		
		let fitButtonContainer = UIView(frame: CGRectZero)
		container.addSubview(fitButtonContainer)
		fitButtonContainer.snp_makeConstraints { (make) in
			make.top.equalTo(label.snp_bottom).offset(6)
			make.bottom.centerX.equalToSuperview()
		}
		
		let fitWidthButton = UIButton(type: .System)
		fitWidthButton.titleLabel?.font = UIFont(name: "Avenir", size: 22)
		fitWidthButton.setTitle("Fit Width", forState: .Normal)
		fitWidthButton.addTarget(self, action: #selector(TestExtCGRectViewController.touchFitButton(_:)), forControlEvents: .TouchUpInside)
		fitWidthButton.tag = 0
		fitButtonContainer.addSubview(fitWidthButton)
		fitWidthButton.snp_makeConstraints { (make) in
			make.top.left.bottom.equalToSuperview()
		}
		
		let fitHeightButton = UIButton(type: .System)
		fitHeightButton.titleLabel?.font = UIFont(name: "Avenir", size: 22)
		fitHeightButton.setTitle("Fit Height", forState: .Normal)
		fitHeightButton.addTarget(self, action: #selector(TestExtCGRectViewController.touchFitButton(_:)), forControlEvents: .TouchUpInside)
		fitHeightButton.tag = 1
		fitButtonContainer.addSubview(fitHeightButton)
		fitHeightButton.snp_makeConstraints { (make) in
			make.left.equalTo(fitWidthButton.snp_right).offset(13)
			make.top.right.bottom.equalToSuperview()
		}
		
		return container
	}

	
	
	// MARK: Touch
	func touchSnapButton(sender: UIButton) -> Void {
		var view2Frame = view2.frame

		switch sender.tag {
		case 0:
			view2Frame = view2Frame.snapTo(view1.frame, position: .TopLeft)
		case 1:
			view2Frame = view2Frame.snapTo(view1.frame, position: .Top)
		case 2:
			view2Frame = view2Frame.snapTo(view1.frame, position: .TopRight)
		case 3:
			view2Frame = view2Frame.snapTo(view1.frame, position: .Left)
		case 4:
			view2Frame = view2Frame.snapTo(view1.frame, position: .Center)
		case 5:
			view2Frame = view2Frame.snapTo(view1.frame, position: .Right)
		case 6:
			view2Frame = view2Frame.snapTo(view1.frame, position: .BottomLeft)
		case 7:
			view2Frame = view2Frame.snapTo(view1.frame, position: .Bottom)
		case 8:
			view2Frame = view2Frame.snapTo(view1.frame, position: .BottomRight)
		default:
			()
		}
		
		UIView.animateWithDuration(0.3) { 
			self.view2.frame = view2Frame
		}
	}
	
	func touchFitButton(sender: UIButton) -> Void {
		var view2Frame = view2.frame
		
		switch sender.tag {
		case 0:
			view2Frame = view2Frame.expand(.Width, length: view1.frame.width)
		case 1:
			view2Frame = view2Frame.expand(.Height, length: view1.frame.height)
		default:
			()
		}

		UIView.animateWithDuration(0.3) {
			self.view2.frame = view2Frame
		}
	}
	
	func touchResetButton(sender: UIButton) -> Void {
		UIView.animateWithDuration(0.3) {
			self.view2.frame = CGRect(x: 30, y: 40, width: 100, height: 80)
		}
	}
}
