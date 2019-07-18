//
//  Filter.swift
//  CoffeeQuest
//
//  Created by Weslie Chen on 2019/7/18.
//  Copyright © 2019 Jay Strawn. All rights reserved.
//

public struct Filter {
    public let filter: (Business) -> Bool
    public var businesses: [Business]
    
    public static func identity() -> Filter {
        return Filter(filter: { _ in return true }, businesses: [])
    }
    
    public static func starRating(atLeast starRating: Double) -> Filter {
        return Filter(filter: { $0.rating >= starRating }, businesses: [])
    }
    
    public func filterBusinesses() -> [Business] {
        return businesses.filter(filter)
    }
}

extension Filter: Sequence {
    public __consuming func makeIterator() -> IndexingIterator<[Business]> {
        return filterBusinesses().makeIterator()
    }
}
