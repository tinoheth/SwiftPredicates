//
//  NSNumber.swift
//  SwiftPredicates
//
//  Created by Tino Heth on 10.01.15.
//  Copyright (c) 2015 Tino Heth. All rights reserved.
//

import Foundation

public func ==(a: NSNumber, b: NSNumber) -> Bool {
	return a.compare(b) == ComparisonResult.orderedSame
}

public func <(a: NSNumber, b: NSNumber) -> Bool {
	return a.compare(b) == ComparisonResult.orderedAscending
}

extension NSNumber: Comparable {}
