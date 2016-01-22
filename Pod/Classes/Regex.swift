//
//  Regex.swift
//  Pods
//
//  Created by Ho Lun Wan on 14/1/2016.
//
//

import Foundation

/**
	http://nshipster.com/swift-literal-convertible/
*/
public struct Regex {
	public let pattern: String
	public let options: NSRegularExpressionOptions!
	private let matcher: NSRegularExpression?
	
	public init(pattern: String, options: NSRegularExpressionOptions = []) throws {
		self.pattern = pattern
		self.options = options
		self.matcher = try NSRegularExpression(pattern: self.pattern, options: self.options)
	}
	
	
	
	
	// MARK: Helper
//	private mutating func updateMatcher() throws {
//		matcher = try NSRegularExpression(pattern: self.pattern, options: self.options)
//	}
	
	public func match(string: String, options: NSMatchingOptions = []) -> Bool {
		return self.matcher?.numberOfMatchesInString(string, options: options, range: NSMakeRange(0, string.utf16.count)) != 0
	}
}