//
//  NSObject+Lazy.swift
//  Pods
//
//  Created by Ho Lun Wan on 26/1/2016.
//
//

import Foundation


public extension NSObject{
	/**
		Get the name of current class
		http://stackoverflow.com/questions/24107658/get-a-user-readable-version-of-the-class-name-in-swift-in-objc-nsstringfromclas
	*/
	public class var nameOfClass: String{
		return NSStringFromClass(self).componentsSeparatedByString(".").last!
	}
	
	/**
		Get the name of current class
		http://stackoverflow.com/questions/24107658/get-a-user-readable-version-of-the-class-name-in-swift-in-objc-nsstringfromclas
	*/
	public var nameOfClass: String{
		return NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
	}
}