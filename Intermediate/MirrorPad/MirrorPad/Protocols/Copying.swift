//
//  Copying.swift
//  MirrorPad
//
//  Created by Weslie Chen on 2019/7/19.
//  Copyright © 2019 Razeware, LLC. All rights reserved.
//

public protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    public func copy() -> Self {
        return type(of: self).init(self)
    }
}

extension Array where Element: Copying {
    public func deepCopy() -> [Element] {
        return map { $0.copy() }
    }
}
