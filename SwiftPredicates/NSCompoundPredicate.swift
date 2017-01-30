//
//  NSCompoundPredicate+Shortcuts.swift
//  Coolspot
//
//  Created by Tino Heth on 10.01.15.
//  Copyright (c) 2015 Tino Heth. All rights reserved.
//

import Foundation

public extension NSCompoundPredicate {
	class func and(_ predicates: NSPredicate ...) -> NSCompoundPredicate {
		return NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
	}

	class func or(_ predicates: NSPredicate ...) -> NSCompoundPredicate {
		return NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
	}
	
	class func not(_ predicate: NSPredicate) -> NSPredicate {
		return NSCompoundPredicate(notPredicateWithSubpredicate: predicate)
	}
}

public func &&(a: NSPredicate, b: NSPredicate) -> NSPredicate {
	return NSCompoundPredicate.and(a, b)
}

public func ||(a: NSPredicate, b: NSPredicate) -> NSPredicate {
	return NSCompoundPredicate.or(a, b)
}

public prefix func !(predicate: NSPredicate) -> NSPredicate {
	return NSCompoundPredicate(notPredicateWithSubpredicate: predicate)
}
