//
//  NSCompoundPredicate+Shortcuts.swift
//  Coolspot
//
//  Created by Tino Heth on 10.01.15.
//  Copyright (c) 2015 Tino Heth. All rights reserved.
//

import Foundation

extension NSCompoundPredicate {
	class func and(predicates: NSPredicate ...) -> NSCompoundPredicate {
		return NSCompoundPredicate.andPredicateWithSubpredicates(predicates)
	}

	class func or(predicates: NSPredicate ...) -> NSCompoundPredicate {
		return NSCompoundPredicate.orPredicateWithSubpredicates(predicates)
	}
}

infix operator && { associativity left }
func &&(a: NSPredicate, b: NSPredicate) -> NSPredicate {
	return NSCompoundPredicate.and(a, b)
}

infix operator || { associativity left }
func ||(a: NSPredicate, b: NSPredicate) -> NSPredicate {
	return NSCompoundPredicate.or(a, b)
}
