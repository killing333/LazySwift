//
//  TestExtUIScrollViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 19/5/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit

class TestExtUIScrollViewController: UIViewController, UIScrollViewDelegate {
	var scrollView: UIScrollView!
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		edgesForExtendedLayout = [ .Left, .Bottom, .Right, ]
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
		view.backgroundColor = UIColor.whiteColor()
		
		scrollView = UIScrollView(frame: CGRectZero)
		scrollView.contentInset = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
		scrollView.delegate = self
		view.addSubview(scrollView)
		scrollView.snp_makeConstraints { (make) in
			make.left.top.right.equalToSuperview()
			make.height.equalTo(scrollView.snp_width)
		}
		
		let scrollContentView = UIImageView(frame: CGRectZero)
		scrollContentView.image = UIImage(named: "Rectangle_Geometry_Vector.svg")
		scrollContentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
		scrollContentView.contentMode = .ScaleToFill
		scrollView.addSubview(scrollContentView)
		scrollContentView.snp_makeConstraints { (make) in
			make.edges.equalToSuperview()
			make.size.equalTo(CGSize(width: 800, height: 600))
		}
		
		// Config button container
		let buttonContainer = UIView(frame: CGRectZero)
		view.addSubview(buttonContainer)
		buttonContainer.snp_makeConstraints { (make) in
			make.top.equalTo(scrollView.snp_bottom).offset(44)
			make.centerX.equalToSuperview()
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
				button.addTarget(self, action: #selector(TestExtUIScrollViewController.touchPositionButton(_:)), forControlEvents: .TouchUpInside)
				button.tag = index
				buttonContainer.addSubview(button)
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
	}
	
	
	
	
	// MARK: Touch
	func touchPositionButton(sender: UIButton) -> Void {
		switch sender.tag {
		case 0:
			scrollView.scrollTo(.TopLeft, animated: true)
		case 1:
			scrollView.scrollTo(.Top, animated: true)
		case 2:
			scrollView.scrollTo(.TopRight, animated: true)
		case 3:
			scrollView.scrollTo(.Left, animated: true)
		case 4:
			scrollView.scrollTo(.Center, animated: true)
		case 5:
			scrollView.scrollTo(.Right, animated: true)
		case 6:
			scrollView.scrollTo(.BottomLeft, animated: true)
		case 7:
			scrollView.scrollTo(.Bottom, animated: true)
		case 8:
			scrollView.scrollTo(.BottomRight, animated: true)
		default:
			()
		}
	}
	
	
	
}
