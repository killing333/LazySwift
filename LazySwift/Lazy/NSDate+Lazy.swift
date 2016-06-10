//
//  NSDate+Lazy.swift
//  LazySwift
//
//  Created by Ho Lun Wan on 10/6/2016.
//
//

import Foundation

public extension NSDate {

	public func isEqualToDateIgnoringTime(otherDate: NSDate) -> Bool {
		let components1 = NSCalendar.currentCalendar().components([ .Year, .Month, .Day], fromDate: self)
		let components2 = NSCalendar.currentCalendar().components([ .Year, .Month, .Day], fromDate: otherDate)
		return components1.year == components2.year && components1.month == components2.month && components1.day == components2.day;
	}
	
	
	/**
		Returns a new NSDate object that is set to a given number of minutes relative to the receiver.
	*/
	public func dateByAddingMinutes(minutes: Double) -> Self {
		return dateByAddingTimeInterval(minutes * 60.0)
	}
	/**
		Returns a new NSDate object that is set to a given number of hours relative to the receiver.
	*/
	public func dateByAddingHours(hours: Double) -> Self {
		return dateByAddingMinutes(hours * 60.0)
	}
	/**
		Returns a new NSDate object that is set to a given number of days relative to the receiver.
	*/
	public func dateByAddingDays(days: Double) -> Self {
		return dateByAddingHours(days * 24.0)
	}
}
