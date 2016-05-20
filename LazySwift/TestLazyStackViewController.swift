//
//  TestLazyStackViewController.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 20/5/2016.
//
//

import UIKit

class TestLazyStackViewController: UIViewController {
	var stackView: LazyStackView!

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
		
		// Config stack view
		stackView = LazyStackView(frame: CGRect(x: 13, y: 13, width: 0, height: 80))
		stackView.backgroundColor = UIColor(white: 0.9, alpha: 1)
		view.addSubview(stackView)
//		stackView.snp_makeConstraints { (make) in
//			make.left.top.equalToSuperview().inset(13)
//			make.height.equalTo(80)
//		}
		
		// Add button
		let addButton = UIBarButtonItem(title: " + ", style: .Plain, target: self, action: #selector(TestLazyStackViewController.touchAddButton(_:)))
		navigationItem.rightBarButtonItems = [ addButton, ]
	}
	
	
	
	// MARK: Touch
	func touchAddButton(sender: AnyObject) -> Void {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: Int(arc4random_uniform(40) + 60), height: Int(arc4random_uniform(40) + 40)))
		view.backgroundColor = UIColor(hue: CGFloat(arc4random_uniform(1000))/1000.0, saturation: 0.3, brightness: 1, alpha: 1)
		stackView.addView(view)
		
		// Observe tap
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TestLazyStackViewController.touchStackViewChild(_:)))
		view.addGestureRecognizer(tapGesture)
	}
	
	func touchStackViewChild(sender: UITapGestureRecognizer) -> Void {
		print("Touched")
		stackView.removeView(sender.view!)
	}
}
