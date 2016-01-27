//
//  UIView+Lazy.swift
//  Pods
//
//  Created by Ho Lun Wan on 26/1/2016.
//
//

import Foundation

public extension UIView {
	
	/**
		Obtain nib for certain name in certain bundle
		- Parameter nibName: Default is the name of current class
		- Parameter bundle: Default is the main bundle
	*/
	public class func nib(var nibName name: String = "", bundle bundleOrNil: NSBundle? = nil) -> UINib {
		if name.isEmpty {
			name = self.nameOfClass
		}
		return UINib(nibName:name , bundle: bundleOrNil)
	}
	
	/**
		Create instance of this class from nib
		Would raise runtime error if nib class not matched
		- Parameter nibName: Default is the name of current class
		- Parameter bundle: Default is the main bundle
	*/
	public class func create<T>(nibName name: String = "", bundle bundleOrNil: NSBundle? = nil, ownerOrNil: AnyObject? = nil, options: [NSObject : AnyObject]? = nil) -> T {
		return self.nib(nibName: name, bundle: bundleOrNil).instantiateWithOwner(nil, options: nil).last! as! T
	}
}